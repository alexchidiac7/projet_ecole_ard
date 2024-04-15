# Install script for directory: /home/pi/ros_catkin_ws/src/roslisp

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/pi/ros_catkin_ws/build/roslisp/catkin_generated/installspace/roslisp.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roslisp/cmake" TYPE FILE FILES "/home/pi/ros_catkin_ws/build/roslisp/catkin_generated/installspace/roslisp-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roslisp/cmake" TYPE FILE FILES
    "/home/pi/ros_catkin_ws/build/roslisp/catkin_generated/installspace/roslispConfig.cmake"
    "/home/pi/ros_catkin_ws/build/roslisp/catkin_generated/installspace/roslispConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roslisp" TYPE FILE FILES "/home/pi/ros_catkin_ws/src/roslisp/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/catkin/profile.d" TYPE FILE FILES "/home/pi/ros_catkin_ws/build/roslisp/catkin_generated/installspace/99.roslisp.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roslisp/catkin_env_hook" TYPE FILE FILES "/home/pi/ros_catkin_ws/build/roslisp/catkin_generated/installspace/99.roslisp.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roslisp" TYPE DIRECTORY FILES "/home/pi/ros_catkin_ws/src/roslisp/load-manifest" REGEX "/\\.svn$" EXCLUDE REGEX "/genmsg\\_lisp\\.py$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roslisp" TYPE DIRECTORY FILES "/home/pi/ros_catkin_ws/src/roslisp/rosbuild" REGEX "/\\.svn$" EXCLUDE REGEX "/genmsg\\_lisp\\.py$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roslisp" TYPE DIRECTORY FILES "/home/pi/ros_catkin_ws/src/roslisp/roslisp-msg-protocol" REGEX "/\\.svn$" EXCLUDE REGEX "/genmsg\\_lisp\\.py$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roslisp" TYPE DIRECTORY FILES "/home/pi/ros_catkin_ws/src/roslisp/src" REGEX "/\\.svn$" EXCLUDE REGEX "/genmsg\\_lisp\\.py$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roslisp" TYPE DIRECTORY FILES "/home/pi/ros_catkin_ws/src/roslisp/s-xml" REGEX "/\\.svn$" EXCLUDE REGEX "/genmsg\\_lisp\\.py$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roslisp" TYPE DIRECTORY FILES "/home/pi/ros_catkin_ws/src/roslisp/s-xml-rpc" REGEX "/\\.svn$" EXCLUDE REGEX "/genmsg\\_lisp\\.py$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roslisp" TYPE DIRECTORY FILES "/home/pi/ros_catkin_ws/src/roslisp/utils" REGEX "/\\.svn$" EXCLUDE REGEX "/genmsg\\_lisp\\.py$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roslisp" TYPE DIRECTORY FILES "/home/pi/ros_catkin_ws/src/roslisp/scripts" USE_SOURCE_PERMISSIONS REGEX "/\\.svn$" EXCLUDE REGEX "/genmsg\\_lisp\\.py$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roslisp/rosbuild" TYPE FILE FILES "/home/pi/ros_catkin_ws/src/roslisp/rosbuild/roslisp.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roslisp/rosbuild/scripts" TYPE PROGRAM FILES "/home/pi/ros_catkin_ws/src/roslisp/rosbuild/scripts/genmsg_lisp.py")
endif()

