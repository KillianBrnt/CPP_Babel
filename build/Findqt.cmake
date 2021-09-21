

include(FindPackageHandleStandardArgs)

message(STATUS "Conan: Using autogenerated Findqt.cmake")
# Global approach
set(qt_FOUND 1)
set(qt_VERSION "5.11.3")

find_package_handle_standard_args(qt REQUIRED_VARS qt_VERSION VERSION_VAR qt_VERSION)
mark_as_advanced(qt_FOUND qt_VERSION)



set(qt_INCLUDE_DIRS "/home/kbrunet/.conan/data/qt/5.11.3/bincrafters/stable/package/ef9c47e3b0e2130ddab615097773c6fd1171704d/include")
set(qt_INCLUDE_DIR "/home/kbrunet/.conan/data/qt/5.11.3/bincrafters/stable/package/ef9c47e3b0e2130ddab615097773c6fd1171704d/include")
set(qt_INCLUDES "/home/kbrunet/.conan/data/qt/5.11.3/bincrafters/stable/package/ef9c47e3b0e2130ddab615097773c6fd1171704d/include")
set(qt_RES_DIRS )
set(qt_DEFINITIONS )
set(qt_LINKER_FLAGS_LIST "" "")
set(qt_COMPILE_DEFINITIONS )
set(qt_COMPILE_OPTIONS_LIST "" "")
set(qt_LIBRARIES_TARGETS "") # Will be filled later, if CMake 3
set(qt_LIBRARIES "") # Will be filled later
set(qt_LIBS "") # Same as qt_LIBRARIES
set(qt_SYSTEM_LIBS )
set(qt_FRAMEWORK_DIRS )
set(qt_FRAMEWORKS )
set(qt_FRAMEWORKS_FOUND "") # Will be filled later
set(qt_BUILD_MODULES_PATHS )

# Apple frameworks
if(APPLE)
    foreach(_FRAMEWORK ${qt_FRAMEWORKS})
        # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
        find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAME ${_FRAMEWORK} PATHS ${qt_FRAMEWORK_DIRS})
        if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
            list(APPEND qt_FRAMEWORKS_FOUND ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
        else()
            message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${qt_FRAMEWORK_DIRS}")
        endif()
    endforeach()
endif()

mark_as_advanced(qt_INCLUDE_DIRS
                 qt_INCLUDE_DIR
                 qt_INCLUDES
                 qt_DEFINITIONS
                 qt_LINKER_FLAGS_LIST
                 qt_COMPILE_DEFINITIONS
                 qt_COMPILE_OPTIONS_LIST
                 qt_LIBRARIES
                 qt_LIBS
                 qt_LIBRARIES_TARGETS)

# Find the real .lib/.a and add them to qt_LIBS and qt_LIBRARY_LIST
set(qt_LIBRARY_LIST )
set(qt_LIB_DIRS "/home/kbrunet/.conan/data/qt/5.11.3/bincrafters/stable/package/ef9c47e3b0e2130ddab615097773c6fd1171704d/lib")
foreach(_LIBRARY_NAME ${qt_LIBRARY_LIST})
    unset(CONAN_FOUND_LIBRARY CACHE)
    find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${qt_LIB_DIRS}
                 NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
    if(CONAN_FOUND_LIBRARY)
        list(APPEND qt_LIBRARIES ${CONAN_FOUND_LIBRARY})
        if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
            # Create a micro-target for each lib/a found
            set(_LIB_NAME CONAN_LIB::qt_${_LIBRARY_NAME})
            if(NOT TARGET ${_LIB_NAME})
                # Create a micro-target for each lib/a found
                add_library(${_LIB_NAME} UNKNOWN IMPORTED)
                set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
            else()
                message(STATUS "Skipping already existing target: ${_LIB_NAME}")
            endif()
            list(APPEND qt_LIBRARIES_TARGETS ${_LIB_NAME})
        endif()
        message(STATUS "Found: ${CONAN_FOUND_LIBRARY}")
    else()
        message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
        list(APPEND qt_LIBRARIES_TARGETS ${_LIBRARY_NAME})
        list(APPEND qt_LIBRARIES ${_LIBRARY_NAME})
    endif()
endforeach()
set(qt_LIBS ${qt_LIBRARIES})

foreach(_FRAMEWORK ${qt_FRAMEWORKS_FOUND})
    list(APPEND qt_LIBRARIES_TARGETS ${_FRAMEWORK})
    list(APPEND qt_LIBRARIES ${_FRAMEWORK})
endforeach()

foreach(_SYSTEM_LIB ${qt_SYSTEM_LIB})
    list(APPEND qt_LIBRARIES_TARGETS ${_SYSTEM_LIB})
    list(APPEND qt_LIBRARIES ${_SYSTEM_LIB})
endforeach()

set(CMAKE_MODULE_PATH "/home/kbrunet/.conan/data/qt/5.11.3/bincrafters/stable/package/ef9c47e3b0e2130ddab615097773c6fd1171704d/" ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH "/home/kbrunet/.conan/data/qt/5.11.3/bincrafters/stable/package/ef9c47e3b0e2130ddab615097773c6fd1171704d/" ${CMAKE_PREFIX_PATH})

foreach(_BUILD_MODULE_PATH ${qt_BUILD_MODULES_PATHS})
    include(${_BUILD_MODULE_PATH})
endforeach()

if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
    # Target approach
    if(NOT TARGET qt::qt)
        add_library(qt::qt INTERFACE IMPORTED)
        
    if(qt_INCLUDE_DIRS)
      set_target_properties(qt::qt PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${qt_INCLUDE_DIRS}")
    endif()
    set_property(TARGET qt::qt PROPERTY INTERFACE_LINK_LIBRARIES ${qt_LIBRARIES_TARGETS} ${qt_SYSTEM_LIBS} "${qt_LINKER_FLAGS_LIST}")
    set_property(TARGET qt::qt PROPERTY INTERFACE_COMPILE_DEFINITIONS ${qt_COMPILE_DEFINITIONS})
    set_property(TARGET qt::qt PROPERTY INTERFACE_COMPILE_OPTIONS "${qt_COMPILE_OPTIONS_LIST}")

            
    # Library dependencies
    include(CMakeFindDependencyMacro)
    find_dependency(OpenSSL REQUIRED)
    get_target_property(tmp OpenSSL::OpenSSL INTERFACE_LINK_LIBRARIES)
    if(tmp)
      set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_LINK_LIBRARIES ${tmp})
    endif()
    get_target_property(tmp OpenSSL::OpenSSL INTERFACE_COMPILE_DEFINITIONS)
    if(tmp)
      set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS ${tmp})
    endif()
    get_target_property(tmp OpenSSL::OpenSSL INTERFACE_INCLUDE_DIRECTORIES)
    if(tmp)
      set_property(TARGET qt::qt APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${tmp})
    endif()
    endif()
endif()
