
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic -Werror -Wshadow)
endif()

macro(rosidl_auto_generate_interfaces)

    if(NOT _AMENT_PACKAGE_NAME)
        ament_package_xml()
    endif()

    set(_interface_files "")
    file(GLOB_RECURSE
        _interface_files
        RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
        msg/*.msg
        srv/*.srv
        action/*.action
    )

    if(_interface_files)
        rosidl_generate_interfaces(${PROJECT_NAME}
            ${_interface_files}
            DEPENDENCIES ${${PROJECT_NAME}_BUILD_DEPENDS}
        )
    else()
        message(FATAL_ERROR "[${PROJECT_NAME}] rosidl_auto_generate_interfaces() called without any interface files found in msg/, srv/, or action/")
    endif()

endmacro()
