# Install script for directory: /home/pi/ros_catkin_ws/src/ros/mk

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/pi/ros_catkin_ws/build/ros/mk/catkin_generated/installspace/mk.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mk/cmake" TYPE FILE FILES
    "/home/pi/ros_catkin_ws/build/ros/mk/catkin_generated/installspace/mkConfig.cmake"
    "/home/pi/ros_catkin_ws/build/ros/mk/catkin_generated/installspace/mkConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mk" TYPE FILE FILES "/home/pi/ros_catkin_ws/src/ros/mk/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mk" TYPE FILE FILES
    "/home/pi/ros_catkin_ws/src/ros/mk/buildtest.mk"
    "/home/pi/ros_catkin_ws/src/ros/mk/bzr_checkout.mk"
    "/home/pi/ros_catkin_ws/src/ros/mk/cmake.mk"
    "/home/pi/ros_catkin_ws/src/ros/mk/cmake_stack.mk"
    "/home/pi/ros_catkin_ws/src/ros/mk/download_unpack_build.mk"
    "/home/pi/ros_catkin_ws/src/ros/mk/eclipse.awk"
    "/home/pi/ros_catkin_ws/src/ros/mk/git_checkout.mk"
    "/home/pi/ros_catkin_ws/src/ros/mk/hg_checkout.mk"
    "/home/pi/ros_catkin_ws/src/ros/mk/make_pydev_project.py"
    "/home/pi/ros_catkin_ws/src/ros/mk/svn_checkout.mk"
    )
endif()

