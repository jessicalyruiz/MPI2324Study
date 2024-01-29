#include <iostream>
#include <vector>
#include <mpi.h>

#define MATRIX_DIMENSION   25

void matrix_mult(double* A, double* b, double* c, int rows, int cols) {
    for(int i=0;i<rows;i++) {
        double tmp = 0;
        for(int j=0;j<cols;j++) {
            tmp = tmp + A[i*cols+j]*b[j];
        }
        c[i] = tmp;
    }
}

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int rank, nprocs;

    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &nprocs);

    int rows_per_rank;
    int rows_alloc = MATRIX_DIMENSION;
    int padding = 0;

    if(MATRIX_DIMENSION%nprocs!=0) {
        rows_alloc = std::ceil((double)MATRIX_DIMENSION/nprocs) * nprocs;
        padding = rows_alloc - MATRIX_DIMENSION;
    }

    rows_per_rank = rows_alloc / nprocs;

    std::unique_ptr<double[]> A;
    std::unique_ptr<double[]> b = std::make_unique<double[]>(MATRIX_DIMENSION);
    std::unique_ptr<double[]> c;

    std::unique_ptr<double[]> A_local;
    std::unique_ptr<double[]> c_local;

    if(rank==0) {
        //imprimir informacion
        std::printf("Dimension: %d, rows_alloc: %d, rows_per_rank: %d, padding: %d\n",
                    MATRIX_DIMENSION, rows_alloc, rows_per_rank, padding);

        //
        A = std::make_unique<double[]>(MATRIX_DIMENSION * rows_alloc);
        c = std::make_unique<double[]>(rows_alloc);;

        for (int i = 0; i < MATRIX_DIMENSION; i++) {
            for (int j = 0; j < MATRIX_DIMENSION; j++) {
                int index = i * MATRIX_DIMENSION + j;
                A[index] = i;
            }
        }
        for (int i = 0; i < MATRIX_DIMENSION; i++) b[i] = 1;
    }

    A_local = std::make_unique<double[]>(MATRIX_DIMENSION*rows_per_rank);
    c_local = std::make_unique<double[]>(rows_per_rank);;

    //enviar/recibir la matriz A
    MPI_Scatter(A.get(), MATRIX_DIMENSION*rows_per_rank, MPI_DOUBLE,
                A_local.get(), MATRIX_DIMENSION*rows_per_rank, MPI_DOUBLE,
                0, MPI_COMM_WORLD);

    std::printf("RANK_%d: [%.0f..%.0f]\n", rank, A_local[0], A_local[MATRIX_DIMENSION*rows_per_rank-1]);

    //enviar el vector b
    MPI_Bcast(b.get(), MATRIX_DIMENSION, MPI_DOUBLE, 0, MPI_COMM_WORLD);

    //realizar el calculo: c = A x b
    int rows_per_rank_tmp = rows_per_rank;
    if(rank==nprocs-1) {
        rows_per_rank_tmp = rows_per_rank - padding;
    }

    matrix_mult(A_local.get(), b.get(), c_local.get(), rows_per_rank_tmp, MATRIX_DIMENSION);

    //enviar/recibir los resultados parciales
    MPI_Gather(c_local.get(), rows_per_rank, MPI_DOUBLE,
               c.get(), rows_per_rank, MPI_DOUBLE,
               0, MPI_COMM_WORLD);

    // immprimir el resultado
    if(rank==0) {
        std::printf("resultado: \n");
        for (int i = 0; i < MATRIX_DIMENSION; i++) {
            std::printf("%.0f, ", c[i]);
        }
    }

    MPI_Finalize();

    return 0;
}