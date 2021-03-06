

include(FindPackageHandleStandardArgs)

message(STATUS "Conan: Using autogenerated Findzlib.cmake")
# Global approach
set(zlib_FOUND 1)
set(zlib_VERSION "1.2.11")

find_package_handle_standard_args(zlib REQUIRED_VARS zlib_VERSION VERSION_VAR zlib_VERSION)
mark_as_advanced(zlib_FOUND zlib_VERSION)



set(zlib_INCLUDE_DIRS "/home/kbrunet/.conan/data/zlib/1.2.11/conan/stable/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include")
set(zlib_INCLUDE_DIR "/home/kbrunet/.conan/data/zlib/1.2.11/conan/stable/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include")
set(zlib_INCLUDES "/home/kbrunet/.conan/data/zlib/1.2.11/conan/stable/package/6af9cc7cb931c5ad942174fd7838eb655717c709/include")
set(zlib_RES_DIRS )
set(zlib_DEFINITIONS )
set(zlib_LINKER_FLAGS_LIST "" "")
set(zlib_COMPILE_DEFINITIONS )
set(zlib_COMPILE_OPTIONS_LIST "" "")
set(zlib_LIBRARIES_TARGETS "") # Will be filled later, if CMake 3
set(zlib_LIBRARIES "") # Will be filled later
set(zlib_LIBS "") # Same as zlib_LIBRARIES
set(zlib_SYSTEM_LIBS )
set(zlib_FRAMEWORK_DIRS )
set(zlib_FRAMEWORKS )
set(zlib_FRAMEWORKS_FOUND "") # Will be filled later
set(zlib_BUILD_MODULES_PATHS )

# Apple frameworks
if(APPLE)
    foreach(_FRAMEWORK ${zlib_FRAMEWORKS})
        # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
        find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAME ${_FRAMEWORK} PATHS ${zlib_FRAMEWORK_DIRS})
        if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
            list(APPEND zlib_FRAMEWORKS_FOUND ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
        else()
            message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${zlib_FRAMEWORK_DIRS}")
        endif()
    endforeach()
endif()

mark_as_advanced(zlib_INCLUDE_DIRS
                 zlib_INCLUDE_DIR
                 zlib_INCLUDES
                 zlib_DEFINITIONS
                 zlib_LINKER_FLAGS_LIST
                 zlib_COMPILE_DEFINITIONS
                 zlib_COMPILE_OPTIONS_LIST
                 zlib_LIBRARIES
                 zlib_LIBS
                 zlib_LIBRARIES_TARGETS)

# Find the real .lib/.a and add them to zlib_LIBS and zlib_LIBRARY_LIST
set(zlib_LIBRARY_LIST z)
set(zlib_LIB_DIRS "/home/kbrunet/.conan/data/zlib/1.2.11/conan/stable/package/6af9cc7cb931c5ad942174fd7838eb655717c709/lib")
foreach(_LIBRARY_NAME ${zlib_LIBRARY_LIST})
    unset(CONAN_FOUND_LIBRARY CACHE)
    find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${zlib_LIB_DIRS}
                 NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
    if(CONAN_FOUND_LIBRARY)
        list(APPEND zlib_LIBRARIES ${CONAN_FOUND_LIBRARY})
        if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
            # Create a micro-target for each lib/a found
            set(_LIB_NAME CONAN_LIB::zlib_${_LIBRARY_NAME})
            if(NOT TARGET ${_LIB_NAME})
                # Create a micro-target for each lib/a found
                add_library(${_LIB_NAME} UNKNOWN IMPORTED)
                set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
            else()
                message(STATUS "Skipping already existing target: ${_LIB_NAME}")
            endif()
            list(APPEND zlib_LIBRARIES_TARGETS ${_LIB_NAME})
        endif()
        message(STATUS "Found: ${CONAN_FOUND_LIBRARY}")
    else()
        message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
        list(APPEND zlib_LIBRARIES_TARGETS ${_LIBRARY_NAME})
        list(APPEND zlib_LIBRARIES ${_LIBRARY_NAME})
    endif()
endforeach()
set(zlib_LIBS ${zlib_LIBRARIES})

foreach(_FRAMEWORK ${zlib_FRAMEWORKS_FOUND})
    list(APPEND zlib_LIBRARIES_TARGETS ${_FRAMEWORK})
    list(APPEND zlib_LIBRARIES ${_FRAMEWORK})
endforeach()

foreach(_SYSTEM_LIB ${zlib_SYSTEM_LIB})
    list(APPEND zlib_LIBRARIES_TARGETS ${_SYSTEM_LIB})
    list(APPEND zlib_LIBRARIES ${_SYSTEM_LIB})
endforeach()

set(CMAKE_MODULE_PATH "/home/kbrunet/.conan/data/zlib/1.2.11/conan/stable/package/6af9cc7cb931c5ad942174fd7838eb655717c709/" ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH "/home/kbrunet/.conan/data/zlib/1.2.11/conan/stable/package/6af9cc7cb931c5ad942174fd7838eb655717c709/" ${CMAKE_PREFIX_PATH})

foreach(_BUILD_MODULE_PATH ${zlib_BUILD_MODULES_PATHS})
    include(${_BUILD_MODULE_PATH})
endforeach()

if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
    # Target approach
    if(NOT TARGET zlib::zlib)
        add_library(zlib::zlib INTERFACE IMPORTED)
        
    if(zlib_INCLUDE_DIRS)
      set_target_properties(zlib::zlib PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${zlib_INCLUDE_DIRS}")
    endif()
    set_property(TARGET zlib::zlib PROPERTY INTERFACE_LINK_LIBRARIES ${zlib_LIBRARIES_TARGETS} ${zlib_SYSTEM_LIBS} "${zlib_LINKER_FLAGS_LIST}")
    set_property(TARGET zlib::zlib PROPERTY INTERFACE_COMPILE_DEFINITIONS ${zlib_COMPILE_DEFINITIONS})
    set_property(TARGET zlib::zlib PROPERTY INTERFACE_COMPILE_OPTIONS "${zlib_COMPILE_OPTIONS_LIST}")

        
    endif()
endif()
