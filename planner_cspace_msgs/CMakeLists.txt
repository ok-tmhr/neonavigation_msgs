cmake_minimum_required(VERSION 3.14.4)
project(planner_cspace_msgs)

if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
endif()

set(MESSAGE_DEPENDS
  geometry_msgs
  std_msgs
)

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators)
foreach(PKD ${MESSAGE_DEPENDS})
  find_package(${PKD} REQUIRED)
endforeach()

rosidl_generate_interfaces(${PROJECT_NAME}
  action/MoveWithTolerance.action
  msg/PlannerStatus.msg
  DEPENDENCIES ${MESSAGE_DEPENDS}
)
ament_export_dependencies(rosidl_default_runtime)
ament_package()
