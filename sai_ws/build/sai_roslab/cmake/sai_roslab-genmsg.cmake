# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "sai_roslab: 1 messages, 0 services")

set(MSG_I_FLAGS "-Isai_roslab:/home/sg/sai_ws/src/sai_roslab/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(sai_roslab_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/sg/sai_ws/src/sai_roslab/msg/scan_range.msg" NAME_WE)
add_custom_target(_sai_roslab_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sai_roslab" "/home/sg/sai_ws/src/sai_roslab/msg/scan_range.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(sai_roslab
  "/home/sg/sai_ws/src/sai_roslab/msg/scan_range.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sai_roslab
)

### Generating Services

### Generating Module File
_generate_module_cpp(sai_roslab
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sai_roslab
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(sai_roslab_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(sai_roslab_generate_messages sai_roslab_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sg/sai_ws/src/sai_roslab/msg/scan_range.msg" NAME_WE)
add_dependencies(sai_roslab_generate_messages_cpp _sai_roslab_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sai_roslab_gencpp)
add_dependencies(sai_roslab_gencpp sai_roslab_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sai_roslab_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(sai_roslab
  "/home/sg/sai_ws/src/sai_roslab/msg/scan_range.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sai_roslab
)

### Generating Services

### Generating Module File
_generate_module_eus(sai_roslab
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sai_roslab
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(sai_roslab_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(sai_roslab_generate_messages sai_roslab_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sg/sai_ws/src/sai_roslab/msg/scan_range.msg" NAME_WE)
add_dependencies(sai_roslab_generate_messages_eus _sai_roslab_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sai_roslab_geneus)
add_dependencies(sai_roslab_geneus sai_roslab_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sai_roslab_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(sai_roslab
  "/home/sg/sai_ws/src/sai_roslab/msg/scan_range.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sai_roslab
)

### Generating Services

### Generating Module File
_generate_module_lisp(sai_roslab
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sai_roslab
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(sai_roslab_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(sai_roslab_generate_messages sai_roslab_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sg/sai_ws/src/sai_roslab/msg/scan_range.msg" NAME_WE)
add_dependencies(sai_roslab_generate_messages_lisp _sai_roslab_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sai_roslab_genlisp)
add_dependencies(sai_roslab_genlisp sai_roslab_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sai_roslab_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(sai_roslab
  "/home/sg/sai_ws/src/sai_roslab/msg/scan_range.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sai_roslab
)

### Generating Services

### Generating Module File
_generate_module_nodejs(sai_roslab
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sai_roslab
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(sai_roslab_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(sai_roslab_generate_messages sai_roslab_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sg/sai_ws/src/sai_roslab/msg/scan_range.msg" NAME_WE)
add_dependencies(sai_roslab_generate_messages_nodejs _sai_roslab_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sai_roslab_gennodejs)
add_dependencies(sai_roslab_gennodejs sai_roslab_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sai_roslab_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(sai_roslab
  "/home/sg/sai_ws/src/sai_roslab/msg/scan_range.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sai_roslab
)

### Generating Services

### Generating Module File
_generate_module_py(sai_roslab
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sai_roslab
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(sai_roslab_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(sai_roslab_generate_messages sai_roslab_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sg/sai_ws/src/sai_roslab/msg/scan_range.msg" NAME_WE)
add_dependencies(sai_roslab_generate_messages_py _sai_roslab_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sai_roslab_genpy)
add_dependencies(sai_roslab_genpy sai_roslab_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sai_roslab_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sai_roslab)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sai_roslab
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(sai_roslab_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(sai_roslab_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sai_roslab)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sai_roslab
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(sai_roslab_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(sai_roslab_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sai_roslab)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sai_roslab
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(sai_roslab_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(sai_roslab_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sai_roslab)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sai_roslab
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(sai_roslab_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(sai_roslab_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sai_roslab)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sai_roslab\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sai_roslab
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(sai_roslab_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(sai_roslab_generate_messages_py sensor_msgs_generate_messages_py)
endif()
