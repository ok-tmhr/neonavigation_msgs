cmake_minimum_required(VERSION 3.14.4)
project(trajectory_tracker_msgs)

set(CMAKE_CXX_STANDARD 17)

set(MESSAGE_DEPENDS
  geometry_msgs
  std_msgs
)

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)

foreach(PKG ${MESSAGE_DEPENDS})
  find_package(${PKG} REQUIRED)
endforeach()

rosidl_generate_interfaces(${PROJECT_NAME}
  srv/ChangePath.srv
  msg/PathWithVelocity.msg
  msg/PoseStampedWithVelocity.msg
  msg/TrajectoryServerStatus.msg
  msg/TrajectoryTrackerStatus.msg
  DEPENDENCIES ${MESSAGE_DEPENDS}
)
ament_export_dependencies(rosidl_default_runtime)

install(DIRECTORY include/
  DESTINATION include/${PROJECT_NAME}
)
ament_export_include_directories()

if (BUILD_TESTING)
  set(THREADS_PREFER_PTHREAD_FLAG ON)
  find_package(Threads REQUIRED)

  find_package(ament_cmake_gtest REQUIRED)
  ament_add_gtest(test_path_with_velocity_conversion test/src/test_path_with_velocity_conversion.cpp)
  
  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()

  target_include_directories(test_path_with_velocity_conversion PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
  )

  rosidl_get_typesupport_target(cpp_typesupport_target
    ${PROJECT_NAME} rosidl_typesupport_cpp
  )

  target_link_libraries(test_path_with_velocity_conversion
    rclcpp::rclcpp ${geometry_msgs_TARGETS} ${nav_msgs_TARGETS} ${std_msgs_TARGETS} ${cpp_typesupport_target}
  )
endif()

ament_package()
