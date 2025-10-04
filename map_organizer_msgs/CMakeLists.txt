cmake_minimum_required(VERSION 3.14.4)
project(map_organizer_msgs)

if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
endif()

set(MESSAGE_DEPENDS
  nav_msgs
)

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)
foreach(PKG ${MESSAGE_DEPENDS})
  find_package(${PKG} REQUIRED)
endforeach()

rosidl_generate_interfaces(${PROJECT_NAME}
  msg/OccupancyGridArray.msg
  DEPENDENCIES ${MESSAGE_DEPENDS}
)
ament_export_dependencies(rosidl_default_runtime)
ament_package()
