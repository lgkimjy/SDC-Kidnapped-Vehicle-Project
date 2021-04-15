project(PARTICLE_FILTER)

cmake_minimum_required (VERSION 3.5)

add_definitions(-std=c++11)

set(CXX_FLAGS "-Wall")
set(CMAKE_CXX_FLAGS "${CXX_FLAGS}")

file(GLOB HEADERS src/*.h)
file(GLOB HEADERS_HPP src/*.hpp)

set(sources src/particle_filter.cpp src/main.cpp ${HEADERS} ${HEADERS_HPP})

if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin") 
include_directories(/usr/local/include)
include_directories(/opt/homebrew/Cellar/openssl@1.1/1.1.1k/include)
include_directories(/opt/homebrew/Cellar/libuv/1.41.0/include)
link_directories(/usr/local/lib)
link_directories(/opt/homebrew/Cellar/openssl@1.1/1.1.1k/lib)
link_directories(/opt/homebrew/Cellar/libuv/1.41.0/lib)
endif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin") 

add_executable(particle_filter ${sources})

target_link_libraries(particle_filter z ssl uv uWS)