# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/nick/Documents/roco318/practicals/starter_task/gettingstarted

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nick/Documents/roco318/practicals/starter_task/build-gettingstarted-Desktop-Debug

# Include any dependencies generated for this target.
include CMakeFiles/gettingstarted.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/gettingstarted.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/gettingstarted.dir/flags.make

CMakeFiles/gettingstarted.dir/main.c.o: CMakeFiles/gettingstarted.dir/flags.make
CMakeFiles/gettingstarted.dir/main.c.o: /home/nick/Documents/roco318/practicals/starter_task/gettingstarted/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nick/Documents/roco318/practicals/starter_task/build-gettingstarted-Desktop-Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/gettingstarted.dir/main.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/gettingstarted.dir/main.c.o   -c /home/nick/Documents/roco318/practicals/starter_task/gettingstarted/main.c

CMakeFiles/gettingstarted.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gettingstarted.dir/main.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/nick/Documents/roco318/practicals/starter_task/gettingstarted/main.c > CMakeFiles/gettingstarted.dir/main.c.i

CMakeFiles/gettingstarted.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gettingstarted.dir/main.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/nick/Documents/roco318/practicals/starter_task/gettingstarted/main.c -o CMakeFiles/gettingstarted.dir/main.c.s

CMakeFiles/gettingstarted.dir/main.c.o.requires:

.PHONY : CMakeFiles/gettingstarted.dir/main.c.o.requires

CMakeFiles/gettingstarted.dir/main.c.o.provides: CMakeFiles/gettingstarted.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/gettingstarted.dir/build.make CMakeFiles/gettingstarted.dir/main.c.o.provides.build
.PHONY : CMakeFiles/gettingstarted.dir/main.c.o.provides

CMakeFiles/gettingstarted.dir/main.c.o.provides.build: CMakeFiles/gettingstarted.dir/main.c.o


# Object files for target gettingstarted
gettingstarted_OBJECTS = \
"CMakeFiles/gettingstarted.dir/main.c.o"

# External object files for target gettingstarted
gettingstarted_EXTERNAL_OBJECTS =

gettingstarted: CMakeFiles/gettingstarted.dir/main.c.o
gettingstarted: CMakeFiles/gettingstarted.dir/build.make
gettingstarted: CMakeFiles/gettingstarted.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nick/Documents/roco318/practicals/starter_task/build-gettingstarted-Desktop-Debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable gettingstarted"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gettingstarted.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/gettingstarted.dir/build: gettingstarted

.PHONY : CMakeFiles/gettingstarted.dir/build

CMakeFiles/gettingstarted.dir/requires: CMakeFiles/gettingstarted.dir/main.c.o.requires

.PHONY : CMakeFiles/gettingstarted.dir/requires

CMakeFiles/gettingstarted.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/gettingstarted.dir/cmake_clean.cmake
.PHONY : CMakeFiles/gettingstarted.dir/clean

CMakeFiles/gettingstarted.dir/depend:
	cd /home/nick/Documents/roco318/practicals/starter_task/build-gettingstarted-Desktop-Debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nick/Documents/roco318/practicals/starter_task/gettingstarted /home/nick/Documents/roco318/practicals/starter_task/gettingstarted /home/nick/Documents/roco318/practicals/starter_task/build-gettingstarted-Desktop-Debug /home/nick/Documents/roco318/practicals/starter_task/build-gettingstarted-Desktop-Debug /home/nick/Documents/roco318/practicals/starter_task/build-gettingstarted-Desktop-Debug/CMakeFiles/gettingstarted.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/gettingstarted.dir/depend

