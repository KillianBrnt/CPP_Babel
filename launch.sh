#!/bin/sh

rm build/ -fr
mkdir -p build && cd build && conan install .. --build=missing && cmake .. -G "Unix Makefiles" && cmake --build . && cp ../qt.conf ./bin/
