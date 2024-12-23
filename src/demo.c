#include <lib-mesg.h>
#include <lib-misc.h>
#include <lib-2k-prs.h>
#include <lib-timing.h>
#include <gmp.h>
#include <stdio.h>
#include <string.h>

#define prng_sec_level 128
#define DEFAULT_MOD_BITS 4096
#define BENCHMARK_ITERATIONS 10

#define input_number 3
#define server_number 10

#define sampling_time 4 /* secondi */
#define max_samples (sampling_time * 50)

gmp_randstate_t prng;

mpz_t eval_parts[input_number][server_number];

void get_outcome(prs_plaintext_t input[], prs_keys_t keys, mpz_t res){
    mpz_mul(res, input[0]->m, input[1]->m);
    mpz_mod(res, res, keys->k_2);
    mpz_mul(res, res, input[2]->m);
    mpz_mod(res, res, keys->k_2);
}

elapsed_time_t time_get_outcome(prs_plaintext_t input[], prs_keys_t keys, mpz_t res)
{
    elapsed_time_t time;
    perform_oneshot_clock_cycles_sampling(time, tu_millis, {
        get_outcome(input, keys, res);
    });
    return time;
}

void random_split(prs_plaintext_t input, prs_plaintext_t parts[], prs_keys_t keys)
{
    mpz_t sum_of_parts;
    mpz_init(sum_of_parts);
    mpz_set_ui(sum_of_parts, 0);
    for(int i=0;i<server_number-1;i++){
        mpz_urandomm(parts[i]->m, prng, input->m);
        mpz_add(sum_of_parts, sum_of_parts, parts[i]->m);
    }
    mpz_sub(parts[server_number-1]->m, input->m, sum_of_parts);
    for(int i=0;i<server_number;i++){
        mpz_mod(parts[i]->m, parts[i]->m, keys->k_2);
        //gmp_printf("Part %d of %Zd is %Zd\n", i, input, parts[i]);
    }
    mpz_clear(sum_of_parts);
}

void share(prs_plaintext_t input[], prs_keys_t keys, prs_ciphertext_t enc_s[][server_number], prs_plaintext_t ss[][server_number]){
    for(int i=0;i<input_number;i++){
        random_split(input[i], ss[i], keys);
        for(int j=0;j<server_number;j++){
            prs_encrypt(enc_s[i][j], keys, ss[i][j], prng, 512);
        }
    }
}

elapsed_time_t time_share(prs_plaintext_t input[], prs_keys_t keys, prs_ciphertext_t enc_s[][server_number], prs_plaintext_t ss[][server_number])
{
    elapsed_time_t time;
    perform_oneshot_clock_cycles_sampling(time, tu_millis, {
        share(input, keys, enc_s, ss);
    });
    return time;
}

void sub_eval(mpz_t a, mpz_t b, mpz_t e, prs_ciphertext_t res, prs_keys_t kk){
    mpz_t t;
    mpz_init(t);

    mpz_mul(t ,a, b);
    mpz_mod(t, t, kk->k_2);

    mpz_powm(t, e, t, kk->n);

    mpz_mul(res->c, res->c, t);
    mpz_mod(res->c, res->c, kk->n);

    mpz_clear(t);
}

void plain_eval(mpz_t a, mpz_t b, mpz_t e, prs_ciphertext_t res, prs_keys_t kk){
    prs_plaintext_t t;
    prs_plaintext_init(t);

    mpz_mul(t->m, a, b);
    mpz_mod(t->m, t->m, kk->k_2);
    mpz_mul(t->m, t->m, e);
    mpz_mod(t->m, t->m, kk->k_2);

    prs_ciphertext_t ct;
    prs_ciphertext_init(ct);
    prs_encrypt(ct, kk, t, prng, 512);

    mpz_mul(res->c, res->c, ct->c);
    mpz_mod(res->c, res->c, kk->n);

    prs_plaintext_clear(t);
    prs_ciphertext_clear(ct);
}

void evaluate(mpz_t eval_parts[][server_number], prs_ciphertext_t s, prs_keys_t keys, int index, prs_plaintext_t ss[][server_number], prs_ciphertext_t enc_share[][server_number]){
    for (int i = 0; i < input_number; i++)
    {
        for (int j = 0; j < server_number; j++)
        {
            if (j != index)
            {
                mpz_set(eval_parts[i][j], ss[i][j]->m);
            }
        }
    }
    for (int i = 0; i < input_number; i++)
    {
        mpz_set(eval_parts[i][index], enc_share[i][index]->c);
    }
    if(index == 0){
        for(int i=1;i<server_number;i++){
            for(int j=1;j<server_number;j++){
                for(int k=1;k<server_number;k++){
                    plain_eval(eval_parts[0][i], eval_parts[1][j], eval_parts[2][k], s, keys);
                }
            }
        }
        for(int i=0;i<input_number;i++){
            int t1 = (i+1) % input_number;
            int t2 = (i+2) % input_number;
            for(int j=1;j<server_number;j++){
                for(int k=1;k<server_number;k++){
                    sub_eval(eval_parts[t1][j], eval_parts[t2][k], eval_parts[i][0], s, keys);
                }
            }
        }
    }
    if(index == 1){
        plain_eval(eval_parts[0][0], eval_parts[1][0], eval_parts[2][0], s, keys);
        for (int i = 0; i < input_number; i++)
        {
            int t1 = (i + 1) % input_number;
            int t2 = (i + 2) % input_number;
            sub_eval(eval_parts[t1][0], eval_parts[t2][0], eval_parts[i][1], s, keys);
            for (int j = 2; j < server_number; j++)
            {
                plain_eval(eval_parts[t1][0], eval_parts[t2][0], eval_parts[i][j], s, keys);
            }
        }
    }
}

elapsed_time_t time_evaluate(mpz_t eval_parts[][server_number], prs_ciphertext_t s, prs_keys_t keys, int index, prs_plaintext_t ss[][server_number], prs_ciphertext_t enc_share[][server_number])
{
    elapsed_time_t time;
    perform_oneshot_clock_cycles_sampling(time, tu_millis, {
        evaluate(eval_parts, s, keys, index, ss, enc_share);
    });
    return time;
}

void decode(prs_ciphertext_t s[], prs_keys_t keys, prs_plaintext_t dec_res){
    prs_ciphertext_t res;
    prs_ciphertext_init(res);
    mpz_set_ui(res->c, 1);

    for(int i=0;i<server_number;i++){
        mpz_mul(res->c, res->c, s[i]->c);
        mpz_mod(res->c, res->c, keys->n);
    }
    prs_decrypt(dec_res, keys, res);

    prs_ciphertext_clear(res);
}

elapsed_time_t time_decode(prs_ciphertext_t s[], prs_keys_t keys, prs_plaintext_t dec_res)
{
    elapsed_time_t time;
    perform_oneshot_clock_cycles_sampling(time, tu_millis, {
        decode(s, keys, dec_res);
    });
    return time;
}

int main(int argc, char *argv[])
{
    printf("Initializing PRNG...\n\n");
    gmp_randinit_default(prng);                // prng means its state & init
    gmp_randseed_os_rng(prng, prng_sec_level); // seed setting

    set_messaging_level(msg_very_verbose); // level of detail of input

    prs_keys_t keys;
    prs_plaintext_t input[input_number], ss[input_number][server_number];
    prs_ciphertext_t enc_share[input_number][server_number], s[server_number];
    for(int i=0;i<input_number;i++){
        prs_plaintext_init(input[i]);
        for(int j=0;j<server_number;j++){
            prs_plaintext_init(ss[i][j]);
            mpz_init(eval_parts[i][j]);
            prs_ciphertext_init(enc_share[i][j]);
        }
    }
    for(int j=0;j<server_number;j++){
        prs_ciphertext_init(s[j]);
        mpz_set_ui(s[j]->c, 1);
    }
    printf("Launching demo with k=%d, n_bits=%d\n\n", DEFAULT_MOD_BITS / 4, DEFAULT_MOD_BITS);

    printf("Calibrating timing tools...\n\n");
    calibrate_clock_cycles_ratio();
    detect_clock_cycles_overhead();
    detect_timestamp_overhead();

    printf("Starting key generation\n");
    elapsed_time_t keygen_time; // no need to consider time of generating the PRNG (little value)
    perform_oneshot_clock_cycles_sampling(keygen_time, tu_millis, {
        prs_generate_keys(keys, DEFAULT_MOD_BITS / 4, DEFAULT_MOD_BITS, prng);
    });
    printf_et("Key generation time elapsed: ", keygen_time, tu_millis, "\n");
    gmp_printf("p: %Zd\n", keys->p);
    gmp_printf("q: %Zd\n", keys->q);
    gmp_printf("n: %Zd\n", keys->n);
    gmp_printf("y: %Zd\n", keys->y);
    printf("k: %d\n", keys->k);
    gmp_printf("2^k: %Zd\n\n", keys->k_2);

    // Direct computation
    for(int i=0;i<input_number;i++){
        mpz_urandomb(input[i]->m, prng, keys->k);
    }
    mpz_t plain_res;
    mpz_init(plain_res);
    elapsed_time_t direct_computation_time;
    direct_computation_time = time_get_outcome(input, keys, plain_res);

    // Sharing
    printf("Starting sharing\n");
    elapsed_time_t share_time;
    share_time = time_share(input, keys, enc_share, ss);
    printf_et("Sharing time elapsed: ", share_time, tu_millis, "\n\n");

    //evaluation
    elapsed_time_t eval_time[server_number];
    for(int i=0;i<server_number;i++){
        printf("S%d starts evaluation!\n", i+1);
        eval_time[i] = time_evaluate(eval_parts, s[i], keys, i, ss, enc_share);
        printf("S%d's ", i+1);
        printf_et("evaluation time elapsed: ", eval_time[i], tu_millis, "\n");
        gmp_printf("S%d outputs: %Zd\n\n", i+1, s[i]->c);
    }
    long total = 0;
    for(int i=0;i<server_number;i++){
        total += eval_time[i];
    }
    elapsed_time_t ave_eval_time = total / server_number;
    printf_et("Each server's evaluation time is approximately: ", ave_eval_time, tu_millis, "\n");

    //dec
    printf("Starting decoding\n");
    prs_plaintext_t dec_res;
    prs_plaintext_init(dec_res);
    elapsed_time_t decoding_time;
    decoding_time = time_decode(s, keys, dec_res);
    printf_et("Decoding time elapsed: ", decoding_time, tu_millis, "\n");
    gmp_printf("Original Result: %Zd\n\n", plain_res);
    gmp_printf("Result from Dec: %Zd\n\n", dec_res->m);
    assert(mpz_cmp(plain_res, dec_res->m) == 0);
    printf_et("HSS time elapsed: ", keygen_time + share_time + ave_eval_time + decoding_time, tu_millis, "\n");
    printf_et("Direct computation time elapsed: ", direct_computation_time, tu_millis, "\n\n");

    printf("All done!!\n");
    for(int i=0;i<input_number;i++){
        prs_plaintext_clear(input[i]);
        for(int j=0;j<server_number;j++){
            prs_plaintext_clear(ss[i][j]);
            mpz_clear(eval_parts[i][j]);
            prs_ciphertext_clear(enc_share[i][j]);
        }
    }
    for(int j=0;j<server_number;j++){
        prs_ciphertext_clear(s[j]);
    }
    prs_plaintext_clear(dec_res);
    gmp_randclear(prng);
    mpz_clear(plain_res);
    return 0;
}
