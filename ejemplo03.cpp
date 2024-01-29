//
// Created by gitpod on 1/16/24.
//
#include <iostream>
#include <mpi.h>



int sumar(int* tmp, int n) {
    int suma = 0;
    for(int i=0;i<n;i++) {
        suma = suma + tmp[i];
    }
    return suma;
}

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int rank, nprocs;

    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &nprocs);

    int data[100];

    if(rank==0) {
        std::printf("total ranks:%d\n", nprocs);

        for(int i=0;i<100;i++) {
            data[i] = i;
        }

        for(int rank_id=1; rank_id<nprocs; rank_id++) {
            std::printf("RANK_0 enviando datos a RANK_%d\n", rank_id);
            int start = rank_id*25;
            MPI_Send(&data[start], 25, MPI_INT, rank_id, 0, MPI_COMM_WORLD);
        }

        int suma_ranks[4];

        suma_ranks[0] = sumar(data, 25);

        for(int rank_id=1; rank_id<nprocs; rank_id++) {
            MPI_Recv(&suma_ranks[rank_id], 1, MPI_INT, rank_id, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        }

        std::printf("sumas parciales: %d, %d, %d, %d\n", suma_ranks[0],suma_ranks[1],suma_ranks[2],suma_ranks[3]);

        int suma_total = sumar(suma_ranks, 4);

        std::printf("SUMA TOLAL: %d\n", suma_total);
    }
    else {
        std::printf("RANK_%d recibiendo datos\n", rank);
        MPI_Recv(data, 25, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

        int suma_parcial = sumar(data, 25);

        std::printf("RANK_%d enviando suma parcial %d\n", rank, suma_parcial);
        MPI_Send(&suma_parcial, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
    }

    MPI_Finalize();

    return 0;
}