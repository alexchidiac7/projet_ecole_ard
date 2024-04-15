# CMake generated Testfile for 
# Source directory: /home/pi/ros_catkin_ws/src/ros/rosmake
# Build directory: /home/pi/ros_catkin_ws/build/ros/rosmake
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_rosmake_nosetests_test "/home/pi/ros_catkin_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python2" "/home/pi/ros_catkin_ws/src/catkin/cmake/test/run_tests.py" "/home/pi/ros_catkin_ws/build/test_results/rosmake/nosetests-test.xml" "--return-code" "\"/usr/bin/cmake\" -E make_directory /home/pi/ros_catkin_ws/build/test_results/rosmake" "/usr/bin/nosetests-2.7 -P --process-timeout=60 --where=/home/pi/ros_catkin_ws/src/ros/rosmake/test --with-xunit --xunit-file=/home/pi/ros_catkin_ws/build/test_results/rosmake/nosetests-test.xml")
set_tests_properties(_ctest_rosmake_nosetests_test PROPERTIES  _BACKTRACE_TRIPLES "/home/pi/ros_catkin_ws/src/catkin/cmake/test/tests.cmake;160;add_test;/home/pi/ros_catkin_ws/src/catkin/cmake/test/nosetests.cmake;83;catkin_run_tests_target;/home/pi/ros_catkin_ws/src/ros/rosmake/CMakeLists.txt;10;catkin_add_nosetests;/home/pi/ros_catkin_ws/src/ros/rosmake/CMakeLists.txt;0;")
