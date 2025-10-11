cmake_minimum_required(VERSION 3.14.4)
project(trajectory_tracker_msgs)

include(${CMAKE_CURRENT_SOURCE_DIR}/../common.cmake)

find_package(ament_cmake_auto REQUIRED)
ament_auto_find_build_dependencies()

rosidl_auto_generate_interfaces()

if (BUILD_TESTING)
  set(THREADS_PREFER_PTHREAD_FLAG ON)
  find_package(Threads REQUIRED)
  ament_auto_find_test_dependencies()

  ament_auto_add_gtest(test_path_with_velocity_conversion test/src/test_path_with_velocity_conversion.cpp)

  rosidl_get_typesupport_target(cpp_typesupport_target
    ${PROJECT_NAME} rosidl_typesupport_cpp
  )

  target_link_libraries(test_path_with_velocity_conversion
    ${cpp_typesupport_target}
  )

endif()

ament_auto_package(USE_SCOPED_HEADER_INSTALL_DIR)
