# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/cmake/203/bin/cmake

# The command to remove a file.
RM = /snap/cmake/203/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kbrunet/workspace/CPP/CPP_babel_2019

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kbrunet/workspace/CPP/CPP_babel_2019/build

# Include any dependencies generated for this target.
include CMakeFiles/client.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/client.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/client.dir/flags.make

CMakeFiles/client.dir/client/src/main.cpp.o: CMakeFiles/client.dir/flags.make
CMakeFiles/client.dir/client/src/main.cpp.o: ../client/src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kbrunet/workspace/CPP/CPP_babel_2019/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/client.dir/client/src/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/client/src/main.cpp.o -c /home/kbrunet/workspace/CPP/CPP_babel_2019/client/src/main.cpp

CMakeFiles/client.dir/client/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/client/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kbrunet/workspace/CPP/CPP_babel_2019/client/src/main.cpp > CMakeFiles/client.dir/client/src/main.cpp.i

CMakeFiles/client.dir/client/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/client/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kbrunet/workspace/CPP/CPP_babel_2019/client/src/main.cpp -o CMakeFiles/client.dir/client/src/main.cpp.s

CMakeFiles/client.dir/client/src/udp_client.cpp.o: CMakeFiles/client.dir/flags.make
CMakeFiles/client.dir/client/src/udp_client.cpp.o: ../client/src/udp_client.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kbrunet/workspace/CPP/CPP_babel_2019/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/client.dir/client/src/udp_client.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/client/src/udp_client.cpp.o -c /home/kbrunet/workspace/CPP/CPP_babel_2019/client/src/udp_client.cpp

CMakeFiles/client.dir/client/src/udp_client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/client/src/udp_client.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kbrunet/workspace/CPP/CPP_babel_2019/client/src/udp_client.cpp > CMakeFiles/client.dir/client/src/udp_client.cpp.i

CMakeFiles/client.dir/client/src/udp_client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/client/src/udp_client.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kbrunet/workspace/CPP/CPP_babel_2019/client/src/udp_client.cpp -o CMakeFiles/client.dir/client/src/udp_client.cpp.s

CMakeFiles/client.dir/client/src/udp_socket.cpp.o: CMakeFiles/client.dir/flags.make
CMakeFiles/client.dir/client/src/udp_socket.cpp.o: ../client/src/udp_socket.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kbrunet/workspace/CPP/CPP_babel_2019/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/client.dir/client/src/udp_socket.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/client/src/udp_socket.cpp.o -c /home/kbrunet/workspace/CPP/CPP_babel_2019/client/src/udp_socket.cpp

CMakeFiles/client.dir/client/src/udp_socket.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/client/src/udp_socket.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kbrunet/workspace/CPP/CPP_babel_2019/client/src/udp_socket.cpp > CMakeFiles/client.dir/client/src/udp_socket.cpp.i

CMakeFiles/client.dir/client/src/udp_socket.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/client/src/udp_socket.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kbrunet/workspace/CPP/CPP_babel_2019/client/src/udp_socket.cpp -o CMakeFiles/client.dir/client/src/udp_socket.cpp.s

CMakeFiles/client.dir/audio/src/Opus.cpp.o: CMakeFiles/client.dir/flags.make
CMakeFiles/client.dir/audio/src/Opus.cpp.o: ../audio/src/Opus.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kbrunet/workspace/CPP/CPP_babel_2019/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/client.dir/audio/src/Opus.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/audio/src/Opus.cpp.o -c /home/kbrunet/workspace/CPP/CPP_babel_2019/audio/src/Opus.cpp

CMakeFiles/client.dir/audio/src/Opus.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/audio/src/Opus.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kbrunet/workspace/CPP/CPP_babel_2019/audio/src/Opus.cpp > CMakeFiles/client.dir/audio/src/Opus.cpp.i

CMakeFiles/client.dir/audio/src/Opus.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/audio/src/Opus.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kbrunet/workspace/CPP/CPP_babel_2019/audio/src/Opus.cpp -o CMakeFiles/client.dir/audio/src/Opus.cpp.s

CMakeFiles/client.dir/audio/src/SoundIn.cpp.o: CMakeFiles/client.dir/flags.make
CMakeFiles/client.dir/audio/src/SoundIn.cpp.o: ../audio/src/SoundIn.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kbrunet/workspace/CPP/CPP_babel_2019/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/client.dir/audio/src/SoundIn.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/audio/src/SoundIn.cpp.o -c /home/kbrunet/workspace/CPP/CPP_babel_2019/audio/src/SoundIn.cpp

CMakeFiles/client.dir/audio/src/SoundIn.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/audio/src/SoundIn.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kbrunet/workspace/CPP/CPP_babel_2019/audio/src/SoundIn.cpp > CMakeFiles/client.dir/audio/src/SoundIn.cpp.i

CMakeFiles/client.dir/audio/src/SoundIn.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/audio/src/SoundIn.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kbrunet/workspace/CPP/CPP_babel_2019/audio/src/SoundIn.cpp -o CMakeFiles/client.dir/audio/src/SoundIn.cpp.s

CMakeFiles/client.dir/audio/src/SoundOut.cpp.o: CMakeFiles/client.dir/flags.make
CMakeFiles/client.dir/audio/src/SoundOut.cpp.o: ../audio/src/SoundOut.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kbrunet/workspace/CPP/CPP_babel_2019/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/client.dir/audio/src/SoundOut.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/audio/src/SoundOut.cpp.o -c /home/kbrunet/workspace/CPP/CPP_babel_2019/audio/src/SoundOut.cpp

CMakeFiles/client.dir/audio/src/SoundOut.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/audio/src/SoundOut.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kbrunet/workspace/CPP/CPP_babel_2019/audio/src/SoundOut.cpp > CMakeFiles/client.dir/audio/src/SoundOut.cpp.i

CMakeFiles/client.dir/audio/src/SoundOut.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/audio/src/SoundOut.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kbrunet/workspace/CPP/CPP_babel_2019/audio/src/SoundOut.cpp -o CMakeFiles/client.dir/audio/src/SoundOut.cpp.s

CMakeFiles/client.dir/audio/src/AudioManager.cpp.o: CMakeFiles/client.dir/flags.make
CMakeFiles/client.dir/audio/src/AudioManager.cpp.o: ../audio/src/AudioManager.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kbrunet/workspace/CPP/CPP_babel_2019/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/client.dir/audio/src/AudioManager.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/audio/src/AudioManager.cpp.o -c /home/kbrunet/workspace/CPP/CPP_babel_2019/audio/src/AudioManager.cpp

CMakeFiles/client.dir/audio/src/AudioManager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/audio/src/AudioManager.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kbrunet/workspace/CPP/CPP_babel_2019/audio/src/AudioManager.cpp > CMakeFiles/client.dir/audio/src/AudioManager.cpp.i

CMakeFiles/client.dir/audio/src/AudioManager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/audio/src/AudioManager.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kbrunet/workspace/CPP/CPP_babel_2019/audio/src/AudioManager.cpp -o CMakeFiles/client.dir/audio/src/AudioManager.cpp.s

CMakeFiles/client.dir/audio/src/MainManager.cpp.o: CMakeFiles/client.dir/flags.make
CMakeFiles/client.dir/audio/src/MainManager.cpp.o: ../audio/src/MainManager.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kbrunet/workspace/CPP/CPP_babel_2019/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/client.dir/audio/src/MainManager.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/client.dir/audio/src/MainManager.cpp.o -c /home/kbrunet/workspace/CPP/CPP_babel_2019/audio/src/MainManager.cpp

CMakeFiles/client.dir/audio/src/MainManager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/client.dir/audio/src/MainManager.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kbrunet/workspace/CPP/CPP_babel_2019/audio/src/MainManager.cpp > CMakeFiles/client.dir/audio/src/MainManager.cpp.i

CMakeFiles/client.dir/audio/src/MainManager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/client.dir/audio/src/MainManager.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kbrunet/workspace/CPP/CPP_babel_2019/audio/src/MainManager.cpp -o CMakeFiles/client.dir/audio/src/MainManager.cpp.s

# Object files for target client
client_OBJECTS = \
"CMakeFiles/client.dir/client/src/main.cpp.o" \
"CMakeFiles/client.dir/client/src/udp_client.cpp.o" \
"CMakeFiles/client.dir/client/src/udp_socket.cpp.o" \
"CMakeFiles/client.dir/audio/src/Opus.cpp.o" \
"CMakeFiles/client.dir/audio/src/SoundIn.cpp.o" \
"CMakeFiles/client.dir/audio/src/SoundOut.cpp.o" \
"CMakeFiles/client.dir/audio/src/AudioManager.cpp.o" \
"CMakeFiles/client.dir/audio/src/MainManager.cpp.o"

# External object files for target client
client_EXTERNAL_OBJECTS =

bin/client: CMakeFiles/client.dir/client/src/main.cpp.o
bin/client: CMakeFiles/client.dir/client/src/udp_client.cpp.o
bin/client: CMakeFiles/client.dir/client/src/udp_socket.cpp.o
bin/client: CMakeFiles/client.dir/audio/src/Opus.cpp.o
bin/client: CMakeFiles/client.dir/audio/src/SoundIn.cpp.o
bin/client: CMakeFiles/client.dir/audio/src/SoundOut.cpp.o
bin/client: CMakeFiles/client.dir/audio/src/AudioManager.cpp.o
bin/client: CMakeFiles/client.dir/audio/src/MainManager.cpp.o
bin/client: CMakeFiles/client.dir/build.make
bin/client: CMakeFiles/client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kbrunet/workspace/CPP/CPP_babel_2019/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX executable bin/client"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/client.dir/build: bin/client

.PHONY : CMakeFiles/client.dir/build

CMakeFiles/client.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/client.dir/cmake_clean.cmake
.PHONY : CMakeFiles/client.dir/clean

CMakeFiles/client.dir/depend:
	cd /home/kbrunet/workspace/CPP/CPP_babel_2019/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kbrunet/workspace/CPP/CPP_babel_2019 /home/kbrunet/workspace/CPP/CPP_babel_2019 /home/kbrunet/workspace/CPP/CPP_babel_2019/build /home/kbrunet/workspace/CPP/CPP_babel_2019/build /home/kbrunet/workspace/CPP/CPP_babel_2019/build/CMakeFiles/client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/client.dir/depend

