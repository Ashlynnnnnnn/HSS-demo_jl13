# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ashlynsun/demo_jl13

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ashlynsun/demo_jl13/build

# Include any dependencies generated for this target.
include CMakeFiles/2k-prs.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/2k-prs.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/2k-prs.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/2k-prs.dir/flags.make

CMakeFiles/2k-prs.dir/src/main.c.o: CMakeFiles/2k-prs.dir/flags.make
CMakeFiles/2k-prs.dir/src/main.c.o: ../src/main.c
CMakeFiles/2k-prs.dir/src/main.c.o: CMakeFiles/2k-prs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ashlynsun/demo_jl13/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/2k-prs.dir/src/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/2k-prs.dir/src/main.c.o -MF CMakeFiles/2k-prs.dir/src/main.c.o.d -o CMakeFiles/2k-prs.dir/src/main.c.o -c /home/ashlynsun/demo_jl13/src/main.c

CMakeFiles/2k-prs.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/2k-prs.dir/src/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ashlynsun/demo_jl13/src/main.c > CMakeFiles/2k-prs.dir/src/main.c.i

CMakeFiles/2k-prs.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/2k-prs.dir/src/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ashlynsun/demo_jl13/src/main.c -o CMakeFiles/2k-prs.dir/src/main.c.s

CMakeFiles/2k-prs.dir/src/utils/lib-mesg.c.o: CMakeFiles/2k-prs.dir/flags.make
CMakeFiles/2k-prs.dir/src/utils/lib-mesg.c.o: ../src/utils/lib-mesg.c
CMakeFiles/2k-prs.dir/src/utils/lib-mesg.c.o: CMakeFiles/2k-prs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ashlynsun/demo_jl13/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/2k-prs.dir/src/utils/lib-mesg.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/2k-prs.dir/src/utils/lib-mesg.c.o -MF CMakeFiles/2k-prs.dir/src/utils/lib-mesg.c.o.d -o CMakeFiles/2k-prs.dir/src/utils/lib-mesg.c.o -c /home/ashlynsun/demo_jl13/src/utils/lib-mesg.c

CMakeFiles/2k-prs.dir/src/utils/lib-mesg.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/2k-prs.dir/src/utils/lib-mesg.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ashlynsun/demo_jl13/src/utils/lib-mesg.c > CMakeFiles/2k-prs.dir/src/utils/lib-mesg.c.i

CMakeFiles/2k-prs.dir/src/utils/lib-mesg.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/2k-prs.dir/src/utils/lib-mesg.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ashlynsun/demo_jl13/src/utils/lib-mesg.c -o CMakeFiles/2k-prs.dir/src/utils/lib-mesg.c.s

CMakeFiles/2k-prs.dir/src/utils/lib-timing.c.o: CMakeFiles/2k-prs.dir/flags.make
CMakeFiles/2k-prs.dir/src/utils/lib-timing.c.o: ../src/utils/lib-timing.c
CMakeFiles/2k-prs.dir/src/utils/lib-timing.c.o: CMakeFiles/2k-prs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ashlynsun/demo_jl13/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/2k-prs.dir/src/utils/lib-timing.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/2k-prs.dir/src/utils/lib-timing.c.o -MF CMakeFiles/2k-prs.dir/src/utils/lib-timing.c.o.d -o CMakeFiles/2k-prs.dir/src/utils/lib-timing.c.o -c /home/ashlynsun/demo_jl13/src/utils/lib-timing.c

CMakeFiles/2k-prs.dir/src/utils/lib-timing.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/2k-prs.dir/src/utils/lib-timing.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ashlynsun/demo_jl13/src/utils/lib-timing.c > CMakeFiles/2k-prs.dir/src/utils/lib-timing.c.i

CMakeFiles/2k-prs.dir/src/utils/lib-timing.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/2k-prs.dir/src/utils/lib-timing.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ashlynsun/demo_jl13/src/utils/lib-timing.c -o CMakeFiles/2k-prs.dir/src/utils/lib-timing.c.s

CMakeFiles/2k-prs.dir/src/utils/lib-misc.c.o: CMakeFiles/2k-prs.dir/flags.make
CMakeFiles/2k-prs.dir/src/utils/lib-misc.c.o: ../src/utils/lib-misc.c
CMakeFiles/2k-prs.dir/src/utils/lib-misc.c.o: CMakeFiles/2k-prs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ashlynsun/demo_jl13/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/2k-prs.dir/src/utils/lib-misc.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/2k-prs.dir/src/utils/lib-misc.c.o -MF CMakeFiles/2k-prs.dir/src/utils/lib-misc.c.o.d -o CMakeFiles/2k-prs.dir/src/utils/lib-misc.c.o -c /home/ashlynsun/demo_jl13/src/utils/lib-misc.c

CMakeFiles/2k-prs.dir/src/utils/lib-misc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/2k-prs.dir/src/utils/lib-misc.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ashlynsun/demo_jl13/src/utils/lib-misc.c > CMakeFiles/2k-prs.dir/src/utils/lib-misc.c.i

CMakeFiles/2k-prs.dir/src/utils/lib-misc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/2k-prs.dir/src/utils/lib-misc.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ashlynsun/demo_jl13/src/utils/lib-misc.c -o CMakeFiles/2k-prs.dir/src/utils/lib-misc.c.s

CMakeFiles/2k-prs.dir/src/lib/lib-2k-prs.c.o: CMakeFiles/2k-prs.dir/flags.make
CMakeFiles/2k-prs.dir/src/lib/lib-2k-prs.c.o: ../src/lib/lib-2k-prs.c
CMakeFiles/2k-prs.dir/src/lib/lib-2k-prs.c.o: CMakeFiles/2k-prs.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ashlynsun/demo_jl13/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/2k-prs.dir/src/lib/lib-2k-prs.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/2k-prs.dir/src/lib/lib-2k-prs.c.o -MF CMakeFiles/2k-prs.dir/src/lib/lib-2k-prs.c.o.d -o CMakeFiles/2k-prs.dir/src/lib/lib-2k-prs.c.o -c /home/ashlynsun/demo_jl13/src/lib/lib-2k-prs.c

CMakeFiles/2k-prs.dir/src/lib/lib-2k-prs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/2k-prs.dir/src/lib/lib-2k-prs.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ashlynsun/demo_jl13/src/lib/lib-2k-prs.c > CMakeFiles/2k-prs.dir/src/lib/lib-2k-prs.c.i

CMakeFiles/2k-prs.dir/src/lib/lib-2k-prs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/2k-prs.dir/src/lib/lib-2k-prs.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ashlynsun/demo_jl13/src/lib/lib-2k-prs.c -o CMakeFiles/2k-prs.dir/src/lib/lib-2k-prs.c.s

# Object files for target 2k-prs
2k__prs_OBJECTS = \
"CMakeFiles/2k-prs.dir/src/main.c.o" \
"CMakeFiles/2k-prs.dir/src/utils/lib-mesg.c.o" \
"CMakeFiles/2k-prs.dir/src/utils/lib-timing.c.o" \
"CMakeFiles/2k-prs.dir/src/utils/lib-misc.c.o" \
"CMakeFiles/2k-prs.dir/src/lib/lib-2k-prs.c.o"

# External object files for target 2k-prs
2k__prs_EXTERNAL_OBJECTS =

2k-prs: CMakeFiles/2k-prs.dir/src/main.c.o
2k-prs: CMakeFiles/2k-prs.dir/src/utils/lib-mesg.c.o
2k-prs: CMakeFiles/2k-prs.dir/src/utils/lib-timing.c.o
2k-prs: CMakeFiles/2k-prs.dir/src/utils/lib-misc.c.o
2k-prs: CMakeFiles/2k-prs.dir/src/lib/lib-2k-prs.c.o
2k-prs: CMakeFiles/2k-prs.dir/build.make
2k-prs: CMakeFiles/2k-prs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ashlynsun/demo_jl13/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking C executable 2k-prs"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/2k-prs.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/2k-prs.dir/build: 2k-prs
.PHONY : CMakeFiles/2k-prs.dir/build

CMakeFiles/2k-prs.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/2k-prs.dir/cmake_clean.cmake
.PHONY : CMakeFiles/2k-prs.dir/clean

CMakeFiles/2k-prs.dir/depend:
	cd /home/ashlynsun/demo_jl13/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ashlynsun/demo_jl13 /home/ashlynsun/demo_jl13 /home/ashlynsun/demo_jl13/build /home/ashlynsun/demo_jl13/build /home/ashlynsun/demo_jl13/build/CMakeFiles/2k-prs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/2k-prs.dir/depend

