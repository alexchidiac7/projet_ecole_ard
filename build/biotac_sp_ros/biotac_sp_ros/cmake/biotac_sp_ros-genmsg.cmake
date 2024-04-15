# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "biotac_sp_ros: 2 messages, 2 services")

set(MSG_I_FLAGS "-Ibiotac_sp_ros:/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg;-Istd_msgs:/home/pi/ros_catkin_ws/src/std_msgs/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(biotac_sp_ros_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/AddTwoInts.srv" NAME_WE)
add_custom_target(_biotac_sp_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "biotac_sp_ros" "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/AddTwoInts.srv" ""
)

get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/HeaderString.msg" NAME_WE)
add_custom_target(_biotac_sp_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "biotac_sp_ros" "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/HeaderString.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/Floats.msg" NAME_WE)
add_custom_target(_biotac_sp_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "biotac_sp_ros" "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/Floats.msg" ""
)

get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/BadTwoInts.srv" NAME_WE)
add_custom_target(_biotac_sp_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "biotac_sp_ros" "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/BadTwoInts.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/HeaderString.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/ros_catkin_ws/src/std_msgs/msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/biotac_sp_ros
)
_generate_msg_cpp(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/Floats.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/biotac_sp_ros
)

### Generating Services
_generate_srv_cpp(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/biotac_sp_ros
)
_generate_srv_cpp(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/BadTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/biotac_sp_ros
)

### Generating Module File
_generate_module_cpp(biotac_sp_ros
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/biotac_sp_ros
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(biotac_sp_ros_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(biotac_sp_ros_generate_messages biotac_sp_ros_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_cpp _biotac_sp_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/HeaderString.msg" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_cpp _biotac_sp_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/Floats.msg" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_cpp _biotac_sp_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/BadTwoInts.srv" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_cpp _biotac_sp_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(biotac_sp_ros_gencpp)
add_dependencies(biotac_sp_ros_gencpp biotac_sp_ros_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS biotac_sp_ros_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/HeaderString.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/ros_catkin_ws/src/std_msgs/msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/biotac_sp_ros
)
_generate_msg_eus(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/Floats.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/biotac_sp_ros
)

### Generating Services
_generate_srv_eus(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/biotac_sp_ros
)
_generate_srv_eus(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/BadTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/biotac_sp_ros
)

### Generating Module File
_generate_module_eus(biotac_sp_ros
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/biotac_sp_ros
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(biotac_sp_ros_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(biotac_sp_ros_generate_messages biotac_sp_ros_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_eus _biotac_sp_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/HeaderString.msg" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_eus _biotac_sp_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/Floats.msg" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_eus _biotac_sp_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/BadTwoInts.srv" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_eus _biotac_sp_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(biotac_sp_ros_geneus)
add_dependencies(biotac_sp_ros_geneus biotac_sp_ros_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS biotac_sp_ros_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/HeaderString.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/ros_catkin_ws/src/std_msgs/msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/biotac_sp_ros
)
_generate_msg_lisp(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/Floats.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/biotac_sp_ros
)

### Generating Services
_generate_srv_lisp(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/biotac_sp_ros
)
_generate_srv_lisp(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/BadTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/biotac_sp_ros
)

### Generating Module File
_generate_module_lisp(biotac_sp_ros
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/biotac_sp_ros
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(biotac_sp_ros_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(biotac_sp_ros_generate_messages biotac_sp_ros_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_lisp _biotac_sp_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/HeaderString.msg" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_lisp _biotac_sp_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/Floats.msg" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_lisp _biotac_sp_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/BadTwoInts.srv" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_lisp _biotac_sp_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(biotac_sp_ros_genlisp)
add_dependencies(biotac_sp_ros_genlisp biotac_sp_ros_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS biotac_sp_ros_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/HeaderString.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/ros_catkin_ws/src/std_msgs/msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/biotac_sp_ros
)
_generate_msg_nodejs(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/Floats.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/biotac_sp_ros
)

### Generating Services
_generate_srv_nodejs(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/biotac_sp_ros
)
_generate_srv_nodejs(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/BadTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/biotac_sp_ros
)

### Generating Module File
_generate_module_nodejs(biotac_sp_ros
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/biotac_sp_ros
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(biotac_sp_ros_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(biotac_sp_ros_generate_messages biotac_sp_ros_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_nodejs _biotac_sp_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/HeaderString.msg" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_nodejs _biotac_sp_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/Floats.msg" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_nodejs _biotac_sp_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/BadTwoInts.srv" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_nodejs _biotac_sp_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(biotac_sp_ros_gennodejs)
add_dependencies(biotac_sp_ros_gennodejs biotac_sp_ros_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS biotac_sp_ros_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/HeaderString.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/ros_catkin_ws/src/std_msgs/msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sp_ros
)
_generate_msg_py(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/Floats.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sp_ros
)

### Generating Services
_generate_srv_py(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/AddTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sp_ros
)
_generate_srv_py(biotac_sp_ros
  "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/BadTwoInts.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sp_ros
)

### Generating Module File
_generate_module_py(biotac_sp_ros
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sp_ros
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(biotac_sp_ros_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(biotac_sp_ros_generate_messages biotac_sp_ros_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/AddTwoInts.srv" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_py _biotac_sp_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/HeaderString.msg" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_py _biotac_sp_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/msg/Floats.msg" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_py _biotac_sp_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/ros_catkin_ws/src/biotac_sp_ros/biotac_sp_ros/srv/BadTwoInts.srv" NAME_WE)
add_dependencies(biotac_sp_ros_generate_messages_py _biotac_sp_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(biotac_sp_ros_genpy)
add_dependencies(biotac_sp_ros_genpy biotac_sp_ros_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS biotac_sp_ros_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/biotac_sp_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/biotac_sp_ros
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(biotac_sp_ros_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/biotac_sp_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/biotac_sp_ros
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(biotac_sp_ros_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/biotac_sp_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/biotac_sp_ros
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(biotac_sp_ros_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/biotac_sp_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/biotac_sp_ros
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(biotac_sp_ros_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sp_ros)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sp_ros\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sp_ros
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  string(REGEX REPLACE "([][+.*()^])" "\\\\\\1" ESCAPED_PATH "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sp_ros")
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/biotac_sp_ros
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${ESCAPED_PATH}/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(biotac_sp_ros_generate_messages_py std_msgs_generate_messages_py)
endif()
