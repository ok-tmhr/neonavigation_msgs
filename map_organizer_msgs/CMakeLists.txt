cmake_minimum_required(VERSION 3.14.4)
project(map_organizer_msgs)

include(${CMAKE_CURRENT_SOURCE_DIR}/../common.cmake)

find_package(ament_cmake_auto REQUIRED)
ament_auto_find_build_dependencies()

rosidl_auto_generate_interfaces()

ament_auto_package()