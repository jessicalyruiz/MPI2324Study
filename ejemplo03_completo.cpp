#include <iostream>
#include <vector>
#include <mpi.h>
#include <memory>

#define MAX_ITEMS   101

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

    if(rank==0) {
        //manejo automático de memoria
        std::unique_ptr<int[]> data = std::make_unique<int[]>(MAX_ITEMS);

        std::printf("total ranks:%d\n", nprocs);

        for(int i=0;i<MAX_ITEMS;i++) {
            data[i] = i;
        }

        int block_size = MAX_ITEMS / nprocs;

        for(int rank_id=1; rank_id<nprocs; rank_id++) {
            int start = (rank_id-1)*block_size;
            std::printf("RANK_0 enviando %d datos a RANK_%d, start=%d\n", block_size, rank_id, start);
            MPI_Send(&data[start], block_size, MPI_INT, rank_id, 0, MPI_COMM_WORLD);
        }

        //el RANK_0 suma el bloque final
        int start = (nprocs-1)*block_size;
        std::printf("RANK_0 procesando %d datos, start=%d\n", MAX_ITEMS-start, start);

        std::vector<int> suma_ranks(nprocs);

        suma_ranks[0] = sumar(data.get() + start, MAX_ITEMS-start);

        for(int rank_id=1; rank_id<nprocs; rank_id++) {
            MPI_Recv(&suma_ranks[rank_id], 1, MPI_INT, rank_id, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        }

        int suma_total = sumar(suma_ranks.data(), nprocs);

        std::printf("SUMA TOTAL: %d\n", suma_total);
    }
    else {
        int block_size = MAX_ITEMS / nprocs;
        std::unique_ptr<int[]> data = std::make_unique<int[]>(block_size);

        std::printf("RANK_%d recibiendo datos\n", rank);
        MPI_Recv(data.get(), block_size, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

        int suma_parcial = sumar(data.get(), block_size);

        std::printf("RANK_%d enviando suma parcial %d\n", rank, suma_parcial);
        MPI_Send(&suma_parcial, 1, MPI_INT, 0, 0, MPI_COMM_WORLD);
    }

    MPI_Finalize();

    return 0;
}