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

# if(CATKIN_ENABLE_TESTING)
# set(THREADS_PREFER_PTHREAD_FLAG ON)
# find_package(Threads REQUIRED)

# find_package(roscpp REQUIRED)
# find_package(rosunit REQUIRED)

# add_compile_options(-std=c++11)

# catkin_add_gtest(test_path_with_velocity_conversion test/src/test_path_with_velocity_conversion.cpp)
# target_link_libraries(test_path_with_velocity_conversion ${catkin_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})

# find_package(roslint REQUIRED)
# roslint_cpp()
# roslint_add_test()
# endif()

# install(DIRECTORY include/${PROJECT_NAME}/
# DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
# )
ament_package()
