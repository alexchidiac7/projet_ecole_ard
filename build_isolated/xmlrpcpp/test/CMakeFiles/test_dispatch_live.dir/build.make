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
CMAKE_SOURCE_DIR = /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/ros_catkin_ws/build_isolated/xmlrpcpp

# Include any dependencies generated for this target.
include test/CMakeFiles/test_dispatch_live.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/test_dispatch_live.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/test_dispatch_live.dir/flags.make

test/CMakeFiles/test_dispatch_live.dir/test_dispatch_live.cpp.o: test/CMakeFiles/test_dispatch_live.dir/flags.make
test/CMakeFiles/test_dispatch_live.dir/test_dispatch_live.cpp.o: /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/test/test_dispatch_live.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/ros_catkin_ws/build_isolated/xmlrpcpp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/test_dispatch_live.dir/test_dispatch_live.cpp.o"
	cd /home/pi/ros_catkin_ws/build_isolated/xmlrpcpp/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_dispatch_live.dir/test_dispatch_live.cpp.o -c /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/test/test_dispatch_live.cpp

test/CMakeFiles/test_dispatch_live.dir/test_dispatch_live.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_dispatch_live.dir/test_dispatch_live.cpp.i"
	cd /home/pi/ros_catkin_ws/build_isolated/xmlrpcpp/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/test/test_dispatch_live.cpp > CMakeFiles/test_dispatch_live.dir/test_dispatch_live.cpp.i

test/CMakeFiles/test_dispatch_live.dir/test_dispatch_live.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_dispatch_live.dir/test_dispatch_live.cpp.s"
	cd /home/pi/ros_catkin_ws/build_isolated/xmlrpcpp/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/test/test_dispatch_live.cpp -o CMakeFiles/test_dispatch_live.dir/test_dispatch_live.cpp.s

# Object files for target test_dispatch_live
test_dispatch_live_OBJECTS = \
"CMakeFiles/test_dispatch_live.dir/test_dispatch_live.cpp.o"

# External object files for target test_dispatch_live
test_dispatch_live_EXTERNAL_OBJECTS =

/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: test/CMakeFiles/test_dispatch_live.dir/test_dispatch_live.cpp.o
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: test/CMakeFiles/test_dispatch_live.dir/build.make
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: /home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/libtest_fixtures.so
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: /usr/lib/arm-linux-gnueabihf/libboost_system.so
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: /usr/lib/arm-linux-gnueabihf/libboost_thread.so
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: /usr/lib/arm-linux-gnueabihf/libboost_chrono.so
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: /usr/lib/arm-linux-gnueabihf/libboost_date_time.so
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: /usr/lib/arm-linux-gnueabihf/libboost_atomic.so
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: gtest/googlemock/gtest/libgtest.so
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: /home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/libxmlrpcpp.so
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: /opt/ros/melodic/lib/librostime.so
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: /opt/ros/melodic/lib/libcpp_common.so
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: /usr/lib/arm-linux-gnueabihf/libconsole_bridge.so.0.4
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: /usr/lib/arm-linux-gnueabihf/libboost_system.so
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: /usr/lib/arm-linux-gnueabihf/libboost_thread.so
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: /usr/lib/arm-linux-gnueabihf/libboost_chrono.so
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: /usr/lib/arm-linux-gnueabihf/libboost_date_time.so
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: /usr/lib/arm-linux-gnueabihf/libboost_atomic.so
/home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live: test/CMakeFiles/test_dispatch_live.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/ros_catkin_ws/build_isolated/xmlrpcpp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live"
	cd /home/pi/ros_catkin_ws/build_isolated/xmlrpcpp/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_dispatch_live.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/test_dispatch_live.dir/build: /home/pi/ros_catkin_ws/devel_isolated/xmlrpcpp/lib/xmlrpcpp/test_dispatch_live

.PHONY : test/CMakeFiles/test_dispatch_live.dir/build

test/CMakeFiles/test_dispatch_live.dir/clean:
	cd /home/pi/ros_catkin_ws/build_isolated/xmlrpcpp/test && $(CMAKE_COMMAND) -P CMakeFiles/test_dispatch_live.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/test_dispatch_live.dir/clean

test/CMakeFiles/test_dispatch_live.dir/depend:
	cd /home/pi/ros_catkin_ws/build_isolated/xmlrpcpp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/test /home/pi/ros_catkin_ws/build_isolated/xmlrpcpp /home/pi/ros_catkin_ws/build_isolated/xmlrpcpp/test /home/pi/ros_catkin_ws/build_isolated/xmlrpcpp/test/CMakeFiles/test_dispatch_live.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/test_dispatch_live.dir/depend

