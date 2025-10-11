cmake_minimum_required(VERSION 3.14.4)
project(neonavigation_metrics_msgs)

include(${CMAKE_CURRENT_SOURCE_DIR}/../common.cmake)

find_package(ament_cmake_auto REQUIRED)
ament_auto_find_build_dependencies()

rosidl_auto_generate_interfaces()

if(BUILD_TESTING)

  ament_auto_find_test_dependencies()
  ament_auto_add_gtest(test_helper test/src/test_helper.cpp)

  rosidl_get_typesupport_target(cpp_typesupport_target
    ${PROJECT_NAME} rosidl_typesupport_cpp
  )
  target_link_libraries(test_helper ${cpp_typesupport_target})

endif()

ament_auto_package(USE_SCOPED_HEADER_INSTALL_DIR)
