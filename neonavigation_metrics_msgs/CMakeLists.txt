cmake_minimum_required(VERSION 3.14.4)
project(neonavigation_metrics_msgs)

if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic -Werror -Wshadow)
endif()

set(MESSAGE_DEPENDS
  std_msgs
)

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)
foreach(PACKAGE ${MESSAGE_DEPENDS})
  find_package(${PACKAGE} REQUIRED)
endforeach()

rosidl_generate_interfaces(${PROJECT_NAME}
  msg/Metric.msg
  msg/Metrics.msg
  DEPENDENCIES ${MESSAGE_DEPENDS}
)
ament_export_dependencies(rosidl_default_runtime)

if(BUILD_TESTING)

  find_package(ament_cmake_gtest REQUIRED)
  ament_add_gtest(test_helper test/src/test_helper.cpp)
  target_include_directories(test_helper PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
  )
  rosidl_get_typesupport_target(cpp_typesupport_target
    ${PROJECT_NAME} rosidl_typesupport_cpp
  )
  target_link_libraries(test_helper ${cpp_typesupport_target})

  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()
endif()

install(DIRECTORY include/
  DESTINATION include/${PROJECT_NAME}
)

ament_export_include_directories()

ament_package()