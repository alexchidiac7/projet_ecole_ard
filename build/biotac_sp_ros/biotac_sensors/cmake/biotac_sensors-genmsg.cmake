# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "biotac_sensors: 3 messages, 0 services")

set(MSG_I_FLAGS "-Ibiotac_sensors:/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg;-Istd_msgs:/home/pi/ros_catkin_ws/src/std_msgs/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(biotac_sensors_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacHand.msg" NAME_WE)
add_custom_target(_biotac_sensors_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "biotac_sensors" "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacHand.msg" "biotac_sensors/BioTacData:biotac_sensors/BioTacTime:std_msgs/Header"
)

get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg" NAME_WE)
add_custom_target(_biotac_sensors_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "biotac_sensors" "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg" ""
)

get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg" NAME_WE)
add_custom_target(_biotac_sensors_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "biotac_sensors" "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(biotac_sensors
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/biotac_sensors
)
_generate_msg_cpp(biotac_sensors
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacHand.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg;/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg;/home/pi/ros_catkin_ws/src/std_msgs/msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/biotac_sensors
)
_generate_msg_cpp(biotac_sensors
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/biotac_sensors
)

### Generating Services

### Generating Module File
_generate_module_cpp(biotac_sensors
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/biotac_sensors
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(biotac_sensors_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(biotac_sensors_generate_messages biotac_sensors_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacHand.msg" NAME_WE)
add_dependencies(biotac_sensors_generate_messages_cpp _biotac_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg" NAME_WE)
add_dependencies(biotac_sensors_generate_messages_cpp _biotac_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg" NAME_WE)
add_dependencies(biotac_sensors_generate_messages_cpp _biotac_sensors_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(biotac_sensors_gencpp)
add_dependencies(biotac_sensors_gencpp biotac_sensors_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS biotac_sensors_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(biotac_sensors
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/biotac_sensors
)
_generate_msg_eus(biotac_sensors
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacHand.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg;/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg;/home/pi/ros_catkin_ws/src/std_msgs/msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/biotac_sensors
)
_generate_msg_eus(biotac_sensors
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/biotac_sensors
)

### Generating Services

### Generating Module File
_generate_module_eus(biotac_sensors
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/biotac_sensors
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(biotac_sensors_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(biotac_sensors_generate_messages biotac_sensors_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacHand.msg" NAME_WE)
add_dependencies(biotac_sensors_generate_messages_eus _biotac_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg" NAME_WE)
add_dependencies(biotac_sensors_generate_messages_eus _biotac_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg" NAME_WE)
add_dependencies(biotac_sensors_generate_messages_eus _biotac_sensors_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(biotac_sensors_geneus)
add_dependencies(biotac_sensors_geneus biotac_sensors_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS biotac_sensors_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(biotac_sensors
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/biotac_sensors
)
_generate_msg_lisp(biotac_sensors
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacHand.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg;/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg;/home/pi/ros_catkin_ws/src/std_msgs/msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/biotac_sensors
)
_generate_msg_lisp(biotac_sensors
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/biotac_sensors
)

### Generating Services

### Generating Module File
_generate_module_lisp(biotac_sensors
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/biotac_sensors
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(biotac_sensors_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(biotac_sensors_generate_messages biotac_sensors_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacHand.msg" NAME_WE)
add_dependencies(biotac_sensors_generate_messages_lisp _biotac_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg" NAME_WE)
add_dependencies(biotac_sensors_generate_messages_lisp _biotac_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg" NAME_WE)
add_dependencies(biotac_sensors_generate_messages_lisp _biotac_sensors_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(biotac_sensors_genlisp)
add_dependencies(biotac_sensors_genlisp biotac_sensors_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS biotac_sensors_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(biotac_sensors
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/biotac_sensors
)
_generate_msg_nodejs(biotac_sensors
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacHand.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg;/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg;/home/pi/ros_catkin_ws/src/std_msgs/msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/biotac_sensors
)
_generate_msg_nodejs(biotac_sensors
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/biotac_sensors
)

### Generating Services

### Generating Module File
_generate_module_nodejs(biotac_sensors
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/biotac_sensors
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(biotac_sensors_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(biotac_sensors_generate_messages biotac_sensors_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacHand.msg" NAME_WE)
add_dependencies(biotac_sensors_generate_messages_nodejs _biotac_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg" NAME_WE)
add_dependencies(biotac_sensors_generate_messages_nodejs _biotac_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg" NAME_WE)
add_dependencies(biotac_sensors_generate_messages_nodejs _biotac_sensors_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(biotac_sensors_gennodejs)
add_dependencies(biotac_sensors_gennodejs biotac_sensors_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS biotac_sensors_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(biotac_sensors
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sensors
)
_generate_msg_py(biotac_sensors
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacHand.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg;/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg;/home/pi/ros_catkin_ws/src/std_msgs/msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sensors
)
_generate_msg_py(biotac_sensors
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sensors
)

### Generating Services

### Generating Module File
_generate_module_py(biotac_sensors
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sensors
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(biotac_sensors_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(biotac_sensors_generate_messages biotac_sensors_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacHand.msg" NAME_WE)
add_dependencies(biotac_sensors_generate_messages_py _biotac_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacTime.msg" NAME_WE)
add_dependencies(biotac_sensors_generate_messages_py _biotac_sensors_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sensors/msg/BioTacData.msg" NAME_WE)
add_dependencies(biotac_sensors_generate_messages_py _biotac_sensors_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(biotac_sensors_genpy)
add_dependencies(biotac_sensors_genpy biotac_sensors_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS biotac_sensors_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/biotac_sensors)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/biotac_sensors
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(biotac_sensors_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/biotac_sensors)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/biotac_sensors
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(biotac_sensors_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/biotac_sensors)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/biotac_sensors
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(biotac_sensors_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/biotac_sensors)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/biotac_sensors
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(biotac_sensors_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sensors)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sensors\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sensors
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(biotac_sensors_generate_messages_py std_msgs_generate_messages_py)
endif()
