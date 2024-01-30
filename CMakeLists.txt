cmake_minimum_required(VERSION 3.27)
project(mpi2324)

set(CMAKE_CXX_STANDARD 14)

find_package(MPI) #make it REQUIRED, if you want

include_directories(SYSTEM ${MPI_INCLUDE_PATH})

add_executable(ejemplo01 ejemplo01.cpp
        MPIstudy.cpp
        ejemplo_matrices.cpp
        ejemplo_matrices.cpp)
target_link_libraries(ejemplo01 ${MPI_CXX_LIBRARIES})

add_executable(ejemplo03_completo ejemplo03_completo.cpp)
target_link_libraries(ejemplo03_completo ${MPI_CXX_LIBRARIES})
