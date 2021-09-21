

include(FindPackageHandleStandardArgs)

message(STATUS "Conan: Using autogenerated Findbzip2.cmake")
# Global approach
set(bzip2_FOUND 1)
set(bzip2_VERSION "1.0.8")

find_package_handle_standard_args(bzip2 REQUIRED_VARS bzip2_VERSION VERSION_VAR bzip2_VERSION)
mark_as_advanced(bzip2_FOUND bzip2_VERSION)



set(bzip2_INCLUDE_DIRS "/home/kbrunet/.conan/data/bzip2/1.0.8/conan/stable/package/da606cf731e334010b0bf6e85a2a6f891b9f36b0/include")
set(bzip2_INCLUDE_DIR "/home/kbrunet/.conan/data/bzip2/1.0.8/conan/stable/package/da606cf731e334010b0bf6e85a2a6f891b9f36b0/include")
set(bzip2_INCLUDES "/home/kbrunet/.conan/data/bzip2/1.0.8/conan/stable/package/da606cf731e334010b0bf6e85a2a6f891b9f36b0/include")
set(bzip2_RES_DIRS )
set(bzip2_DEFINITIONS )
set(bzip2_LINKER_FLAGS_LIST "" "")
set(bzip2_COMPILE_DEFINITIONS )
set(bzip2_COMPILE_OPTIONS_LIST "" "")
set(bzip2_LIBRARIES_TARGETS "") # Will be filled later, if CMake 3
set(bzip2_LIBRARIES "") # Will be filled later
set(bzip2_LIBS "") # Same as bzip2_LIBRARIES
set(bzip2_SYSTEM_LIBS )
set(bzip2_FRAMEWORK_DIRS )
set(bzip2_FRAMEWORKS )
set(bzip2_FRAMEWORKS_FOUND "") # Will be filled later
set(bzip2_BUILD_MODULES_PATHS )

# Apple frameworks
if(APPLE)
    foreach(_FRAMEWORK ${bzip2_FRAMEWORKS})
        # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
        find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAME ${_FRAMEWORK} PATHS ${bzip2_FRAMEWORK_DIRS})
        if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
            list(APPEND bzip2_FRAMEWORKS_FOUND ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
        else()
            message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${bzip2_FRAMEWORK_DIRS}")
        endif()
    endforeach()
endif()

mark_as_advanced(bzip2_INCLUDE_DIRS
                 bzip2_INCLUDE_DIR
                 bzip2_INCLUDES
                 bzip2_DEFINITIONS
                 bzip2_LINKER_FLAGS_LIST
                 bzip2_COMPILE_DEFINITIONS
                 bzip2_COMPILE_OPTIONS_LIST
                 bzip2_LIBRARIES
                 bzip2_LIBS
                 bzip2_LIBRARIES_TARGETS)

# Find the real .lib/.a and add them to bzip2_LIBS and bzip2_LIBRARY_LIST
set(bzip2_LIBRARY_LIST bz2)
set(bzip2_LIB_DIRS "/home/kbrunet/.conan/data/bzip2/1.0.8/conan/stable/package/da606cf731e334010b0bf6e85a2a6f891b9f36b0/lib")
foreach(_LIBRARY_NAME ${bzip2_LIBRARY_LIST})
    unset(CONAN_FOUND_LIBRARY CACHE)
    find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${bzip2_LIB_DIRS}
                 NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
    if(CONAN_FOUND_LIBRARY)
        list(APPEND bzip2_LIBRARIES ${CONAN_FOUND_LIBRARY})
        if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
            # Create a micro-target for each lib/a found
            set(_LIB_NAME CONAN_LIB::bzip2_${_LIBRARY_NAME})
            if(NOT TARGET ${_LIB_NAME})
                # Create a micro-target for each lib/a found
                add_library(${_LIB_NAME} UNKNOWN IMPORTED)
                set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
            else()
                message(STATUS "Skipping already existing target: ${_LIB_NAME}")
            endif()
            list(APPEND bzip2_LIBRARIES_TARGETS ${_LIB_NAME})
        endif()
        message(STATUS "Found: ${CONAN_FOUND_LIBRARY}")
    else()
        message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
        list(APPEND bzip2_LIBRARIES_TARGETS ${_LIBRARY_NAME})
        list(APPEND bzip2_LIBRARIES ${_LIBRARY_NAME})
    endif()
endforeach()
set(bzip2_LIBS ${bzip2_LIBRARIES})

foreach(_FRAMEWORK ${bzip2_FRAMEWORKS_FOUND})
    list(APPEND bzip2_LIBRARIES_TARGETS ${_FRAMEWORK})
    list(APPEND bzip2_LIBRARIES ${_FRAMEWORK})
endforeach()

foreach(_SYSTEM_LIB ${bzip2_SYSTEM_LIB})
    list(APPEND bzip2_LIBRARIES_TARGETS ${_SYSTEM_LIB})
    list(APPEND bzip2_LIBRARIES ${_SYSTEM_LIB})
endforeach()

set(CMAKE_MODULE_PATH "/home/kbrunet/.conan/data/bzip2/1.0.8/conan/stable/package/da606cf731e334010b0bf6e85a2a6f891b9f36b0/" ${CMAKE_MODULE_PATH})
set(CMAKE_PREFIX_PATH "/home/kbrunet/.conan/data/bzip2/1.0.8/conan/stable/package/da606cf731e334010b0bf6e85a2a6f891b9f36b0/" ${CMAKE_PREFIX_PATH})

foreach(_BUILD_MODULE_PATH ${bzip2_BUILD_MODULES_PATHS})
    include(${_BUILD_MODULE_PATH})
endforeach()

if(NOT ${CMAKE_VERSION} VERSION_LESS "3.0")
    # Target approach
    if(NOT TARGET bzip2::bzip2)
        add_library(bzip2::bzip2 INTERFACE IMPORTED)
        
    if(bzip2_INCLUDE_DIRS)
      set_target_properties(bzip2::bzip2 PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${bzip2_INCLUDE_DIRS}")
    endif()
    set_property(TARGET bzip2::bzip2 PROPERTY INTERFACE_LINK_LIBRARIES ${bzip2_LIBRARIES_TARGETS} ${bzip2_SYSTEM_LIBS} "${bzip2_LINKER_FLAGS_LIST}")
    set_property(TARGET bzip2::bzip2 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${bzip2_COMPILE_DEFINITIONS})
    set_property(TARGET bzip2::bzip2 PROPERTY INTERFACE_COMPILE_OPTIONS "${bzip2_COMPILE_OPTIONS_LIST}")

        
    endif()
endif()