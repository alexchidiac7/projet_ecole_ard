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

# Include any dependencies generated for this target.
include ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/depend.make

# Include the progress variables for this target.
include ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/progress.make

# Include the compile flags for this target's objects.
include ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/flags.make

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/test_dispatch.cpp.o: ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/flags.make
ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/test_dispatch.cpp.o: /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/test/test_dispatch.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/ros_catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/test_dispatch.cpp.o"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_dispatch.dir/test_dispatch.cpp.o -c /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/test/test_dispatch.cpp

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/test_dispatch.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_dispatch.dir/test_dispatch.cpp.i"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/test/test_dispatch.cpp > CMakeFiles/test_dispatch.dir/test_dispatch.cpp.i

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/test_dispatch.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_dispatch.dir/test_dispatch.cpp.s"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/test/test_dispatch.cpp -o CMakeFiles/test_dispatch.dir/test_dispatch.cpp.s

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcDispatch.cpp.o: ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/flags.make
ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcDispatch.cpp.o: /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/src/XmlRpcDispatch.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/ros_catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcDispatch.cpp.o"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_dispatch.dir/__/src/XmlRpcDispatch.cpp.o -c /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/src/XmlRpcDispatch.cpp

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcDispatch.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_dispatch.dir/__/src/XmlRpcDispatch.cpp.i"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/src/XmlRpcDispatch.cpp > CMakeFiles/test_dispatch.dir/__/src/XmlRpcDispatch.cpp.i

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcDispatch.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_dispatch.dir/__/src/XmlRpcDispatch.cpp.s"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/src/XmlRpcDispatch.cpp -o CMakeFiles/test_dispatch.dir/__/src/XmlRpcDispatch.cpp.s

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcSource.cpp.o: ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/flags.make
ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcSource.cpp.o: /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/src/XmlRpcSource.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/ros_catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcSource.cpp.o"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_dispatch.dir/__/src/XmlRpcSource.cpp.o -c /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/src/XmlRpcSource.cpp

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcSource.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_dispatch.dir/__/src/XmlRpcSource.cpp.i"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/src/XmlRpcSource.cpp > CMakeFiles/test_dispatch.dir/__/src/XmlRpcSource.cpp.i

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcSource.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_dispatch.dir/__/src/XmlRpcSource.cpp.s"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/src/XmlRpcSource.cpp -o CMakeFiles/test_dispatch.dir/__/src/XmlRpcSource.cpp.s

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcUtil.cpp.o: ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/flags.make
ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcUtil.cpp.o: /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/src/XmlRpcUtil.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/ros_catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcUtil.cpp.o"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_dispatch.dir/__/src/XmlRpcUtil.cpp.o -c /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/src/XmlRpcUtil.cpp

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcUtil.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_dispatch.dir/__/src/XmlRpcUtil.cpp.i"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/src/XmlRpcUtil.cpp > CMakeFiles/test_dispatch.dir/__/src/XmlRpcUtil.cpp.i

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcUtil.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_dispatch.dir/__/src/XmlRpcUtil.cpp.s"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/src/XmlRpcUtil.cpp -o CMakeFiles/test_dispatch.dir/__/src/XmlRpcUtil.cpp.s

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/libb64/src/cdecode.c.o: ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/flags.make
ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/libb64/src/cdecode.c.o: /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/libb64/src/cdecode.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/ros_catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/libb64/src/cdecode.c.o"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_dispatch.dir/__/libb64/src/cdecode.c.o   -c /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/libb64/src/cdecode.c

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/libb64/src/cdecode.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_dispatch.dir/__/libb64/src/cdecode.c.i"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/libb64/src/cdecode.c > CMakeFiles/test_dispatch.dir/__/libb64/src/cdecode.c.i

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/libb64/src/cdecode.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_dispatch.dir/__/libb64/src/cdecode.c.s"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/libb64/src/cdecode.c -o CMakeFiles/test_dispatch.dir/__/libb64/src/cdecode.c.s

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/libb64/src/cencode.c.o: ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/flags.make
ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/libb64/src/cencode.c.o: /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/libb64/src/cencode.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/ros_catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/libb64/src/cencode.c.o"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/test_dispatch.dir/__/libb64/src/cencode.c.o   -c /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/libb64/src/cencode.c

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/libb64/src/cencode.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test_dispatch.dir/__/libb64/src/cencode.c.i"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/libb64/src/cencode.c > CMakeFiles/test_dispatch.dir/__/libb64/src/cencode.c.i

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/libb64/src/cencode.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test_dispatch.dir/__/libb64/src/cencode.c.s"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/libb64/src/cencode.c -o CMakeFiles/test_dispatch.dir/__/libb64/src/cencode.c.s

# Object files for target test_dispatch
test_dispatch_OBJECTS = \
"CMakeFiles/test_dispatch.dir/test_dispatch.cpp.o" \
"CMakeFiles/test_dispatch.dir/__/src/XmlRpcDispatch.cpp.o" \
"CMakeFiles/test_dispatch.dir/__/src/XmlRpcSource.cpp.o" \
"CMakeFiles/test_dispatch.dir/__/src/XmlRpcUtil.cpp.o" \
"CMakeFiles/test_dispatch.dir/__/libb64/src/cdecode.c.o" \
"CMakeFiles/test_dispatch.dir/__/libb64/src/cencode.c.o"

# External object files for target test_dispatch
test_dispatch_EXTERNAL_OBJECTS =

/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/test_dispatch.cpp.o
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcDispatch.cpp.o
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcSource.cpp.o
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/src/XmlRpcUtil.cpp.o
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/libb64/src/cdecode.c.o
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/__/libb64/src/cencode.c.o
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/build.make
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: /home/pi/ros_catkin_ws/devel/lib/libmock_socket.so
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: /home/pi/ros_catkin_ws/devel/lib/librostime.so
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: /home/pi/ros_catkin_ws/devel/lib/libcpp_common.so
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: /usr/lib/arm-linux-gnueabihf/libboost_system.so
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: /usr/lib/arm-linux-gnueabihf/libboost_thread.so
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: /usr/lib/arm-linux-gnueabihf/libboost_chrono.so
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: /usr/lib/arm-linux-gnueabihf/libboost_date_time.so
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: /usr/lib/arm-linux-gnueabihf/libboost_atomic.so
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: /usr/lib/arm-linux-gnueabihf/libconsole_bridge.so.0.4
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: gtest/googlemock/gtest/libgtest.so
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: /usr/lib/arm-linux-gnueabihf/librt.so
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: /usr/lib/arm-linux-gnueabihf/libconsole_bridge.so.0.4
/home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch: ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/ros_catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable /home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch"
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_dispatch.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/build: /home/pi/ros_catkin_ws/devel/lib/xmlrpcpp/test_dispatch

.PHONY : ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/build

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/clean:
	cd /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test && $(CMAKE_COMMAND) -P CMakeFiles/test_dispatch.dir/cmake_clean.cmake
.PHONY : ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/clean

ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/depend:
	cd /home/pi/ros_catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/ros_catkin_ws/src /home/pi/ros_catkin_ws/src/ros_comm/xmlrpcpp/test /home/pi/ros_catkin_ws/build /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test /home/pi/ros_catkin_ws/build/ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ros_comm/xmlrpcpp/test/CMakeFiles/test_dispatch.dir/depend

