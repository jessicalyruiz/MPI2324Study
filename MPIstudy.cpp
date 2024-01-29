//
// Created by Jessirena on 27/01/2024.
//
#include <mpi.h>

int main( int argc, char * argv[]){
    MPI_Init(&argc, &argv);
    MPI_Finalize();
    return (0);
}