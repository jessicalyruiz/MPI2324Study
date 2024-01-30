//
// Created by Jessirena on 27/01/2024.
//
#include <mpi.h>
#include <iostream>

int main( int argc, char * argv[]){
    MPI_Init(&argc, &argv);
    int rank, nprocess;

    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD,&nprocess);
    std::printf("rank: %d,  de %d procesos  \n", rank, nprocess);
    //arreglo
    int


    MPI_Finalize();
    return (0);
}