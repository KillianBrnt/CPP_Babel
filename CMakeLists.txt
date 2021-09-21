project(Babel)
cmake_minimum_required(VERSION 2.8.12)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
add_definitions("-fPIC")
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

set(CLIENTSRCS
  client/src/main.cpp
  client/src/udp_client.cpp
  client/src/udp_socket.cpp
  audio/src/Opus.cpp
  audio/src/SoundIn.cpp
  audio/src/SoundOut.cpp
  audio/src/AudioManager.cpp
  audio/src/MainManager.cpp
)

set(CLIENTHDRS
  client/include/udp_client.hpp
  client/include/udp_socket.hpp
  audio/include/IEncoder.hpp
  audio/include/ISoundHand.hpp
  audio/include/SoundIn.hpp
  audio/include/SoundOut.hpp
  audio/include/Opus.hpp
  audio/include/Sound.hpp
  audio/include/AudioManager.hpp
  audio/include/MainManager.hpp
)

set(SERVERSRCS
  server/src/main.cpp
  server/src/udp_server.cpp
  server/src/udp_socket.cpp
  server/src/client.cpp
)

set(SERVERHDRS
  server/include/client.hpp
  server/include/udp_server.hpp
  server/include/udp_socket.hpp
)

include_directories(${CMAKE_INCLUDE_PATH})

add_executable(client ${CLIENTSRCS} ${CLIENTHDRS})
add_executable(server ${SERVERSRCS} ${SERVERHDRS})

target_link_libraries(client ${CONAN_LIBS})
target_link_libraries(server ${CONAN_LIBS})