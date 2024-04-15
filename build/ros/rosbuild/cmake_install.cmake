# Install script for directory: /home/pi/ros_catkin_ws/src/ros/rosbuild

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/pi/ros_catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/pi/ros_catkin_ws/build/ros/rosbuild/catkin_generated/installspace/rosbuild.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosbuild/cmake" TYPE FILE FILES
    "/home/pi/ros_catkin_ws/build/ros/rosbuild/catkin_generated/installspace/rosbuildConfig.cmake"
    "/home/pi/ros_catkin_ws/build/ros/rosbuild/catkin_generated/installspace/rosbuildConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosbuild" TYPE FILE FILES "/home/pi/ros_catkin_ws/src/ros/rosbuild/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/catkin/profile.d" TYPE FILE FILES "/home/pi/ros_catkin_ws/build/ros/rosbuild/catkin_generated/installspace/10.rosbuild.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rosbuild/catkin_env_hook" TYPE FILE FILES "/home/pi/ros_catkin_ws/build/ros/rosbuild/catkin_generated/installspace/10.rosbuild.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros/core/rosbuild" TYPE FILE FILES
    "/home/pi/ros_catkin_ws/src/ros/rosbuild/core/rosbuild/FindPkgConfig.cmake"
    "/home/pi/ros_catkin_ws/src/ros/rosbuild/core/rosbuild/private.cmake"
    "/home/pi/ros_catkin_ws/src/ros/rosbuild/core/rosbuild/ProcessorCount.cmake"
    "/home/pi/ros_catkin_ws/src/ros/rosbuild/core/rosbuild/public.cmake"
    "/home/pi/ros_catkin_ws/src/ros/rosbuild/core/rosbuild/rosbuild.cmake"
    "/home/pi/ros_catkin_ws/src/ros/rosbuild/core/rosbuild/rosconfig.cmake"
    "/home/pi/ros_catkin_ws/src/ros/rosbuild/core/rosbuild/rostoolchain.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros/core/rosbuild/tests" TYPE PROGRAM FILES "/home/pi/ros_catkin_ws/build/ros/rosbuild/catkin_generated/installspace/count_cores.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros/core/rosbuild/bin" TYPE PROGRAM FILES "/home/pi/ros_catkin_ws/build/ros/rosbuild/catkin_generated/installspace/check_same_directories.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ros/core/rosbuild/bin" TYPE PROGRAM FILES "/home/pi/ros_catkin_ws/build/ros/rosbuild/catkin_generated/installspace/download_checkmd5.py")
endif()

