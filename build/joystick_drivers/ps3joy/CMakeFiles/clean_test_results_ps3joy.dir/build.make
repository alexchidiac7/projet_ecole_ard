# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /home/pi/ros_catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/ros_catkin_ws/build

# Utility rule file for clean_test_results_ps3joy.

# Include the progress variables for this target.
include joystick_drivers/ps3joy/CMakeFiles/clean_test_results_ps3joy.dir/progress.make

joystick_drivers/ps3joy/CMakeFiles/clean_test_results_ps3joy:
	cd /home/pi/ros_catkin_ws/build/joystick_drivers/ps3joy && /usr/bin/python2 /home/pi/ros_catkin_ws/src/catkin/cmake/test/remove_test_results.py /home/pi/ros_catkin_ws/build/test_results/ps3joy

clean_test_results_ps3joy: joystick_drivers/ps3joy/CMakeFiles/clean_test_results_ps3joy
clean_test_results_ps3joy: joystick_drivers/ps3joy/CMakeFiles/clean_test_results_ps3joy.dir/build.make

.PHONY : clean_test_results_ps3joy

# Rule to build all files generated by this target.
joystick_drivers/ps3joy/CMakeFiles/clean_test_results_ps3joy.dir/build: clean_test_results_ps3joy

.PHONY : joystick_drivers/ps3joy/CMakeFiles/clean_test_results_ps3joy.dir/build

joystick_drivers/ps3joy/CMakeFiles/clean_test_results_ps3joy.dir/clean:
	cd /home/pi/ros_catkin_ws/build/joystick_drivers/ps3joy && $(CMAKE_COMMAND) -P CMakeFiles/clean_test_results_ps3joy.dir/cmake_clean.cmake
.PHONY : joystick_drivers/ps3joy/CMakeFiles/clean_test_results_ps3joy.dir/clean

joystick_drivers/ps3joy/CMakeFiles/clean_test_results_ps3joy.dir/depend:
	cd /home/pi/ros_catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/ros_catkin_ws/src /home/pi/ros_catkin_ws/src/joystick_drivers/ps3joy /home/pi/ros_catkin_ws/build /home/pi/ros_catkin_ws/build/joystick_drivers/ps3joy /home/pi/ros_catkin_ws/build/joystick_drivers/ps3joy/CMakeFiles/clean_test_results_ps3joy.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : joystick_drivers/ps3joy/CMakeFiles/clean_test_results_ps3joy.dir/depend

