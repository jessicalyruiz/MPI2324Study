//
// Created by Jessirena on 27/01/2024.
//
#include <mpi.h>
#include <iostream>
#include <vector>

#define MAX_ITEMS 51



int sumar(int *datos, int n){
    int suma=0;
    for (int i = 0; i < n; ++i) {
        suma= suma+datos[i];
      //  std::printf("***datos suma: %d ***",datos[i]);
    }
    return  suma;
}

int main( int argc, char * argv[]){
    MPI_Init(&argc, &argv);
    int rank, nprocess;

    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD,&nprocess);
  //  std::printf("rank: %d,  de %d procesos  \n", rank, nprocess);
    //arreglo
    int data[100];

   /* if (rank==0){
        for (int i = 0; i <100 ; ++i) {
            data[i]=i;
        }

        for (int i = 1; i < nprocess; ++i) {
            MPI_Send(data, 100, MPI_INT,
                     i,0, MPI_COMM_WORLD
                    );
            std::printf("Enviando al rank_%d \n", i);
        }
    } else{
        MPI_Recv(data, 100, MPI_INT,
                 0,0,MPI_COMM_WORLD, MPI_STATUS_IGNORE);
   std::printf("rank_%d recibiendo datos \n", rank);

    }*/
/// sumar datos de un vector


//TAMANIO DEL BLOQUE
int block_size=MAX_ITEMS/nprocess;

if(rank==0){
    //leno el vector
    for (int i = 0; i <100 ; ++i) {
        data[i]=i;
    }
    //envio los datos

    for (int i = 1; i < nprocess; ++i) {
        int start=(i-1)*block_size;
        MPI_Send(&data[start], block_size, MPI_INT,
                 i,0, MPI_COMM_WORLD);
    }

    //PROCESO EL ULTIMO BLOQUE EN EL RANK 0
    int start=(nprocess-1)*block_size;
    int suma= sumar(&data[start], (MAX_ITEMS-start));
     std::printf("Suma rank 0: %d, start: %d \n",suma, start);

        //recibo las sumas parciales
        std::vector<int> sumas_part(nprocess-1);

    for (int i = 1; i < nprocess; ++i) {
        MPI_Recv(&sumas_part[i-1],1, MPI_INT,
                 i,0,MPI_COMM_WORLD, MPI_STATUS_IGNORE);

    }

    //sumo total
    for (int i = 0; i < nprocess-1; ++i) {
        suma=suma+sumas_part[i];
    }
    std::printf("Suma toal: %d \n", suma);

}else{
    //recibo los datos
    int data_temp[block_size];
    MPI_Recv(data_temp, block_size, MPI_INT,
             0,0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
    int suma_parcial= sumar(data_temp,block_size);
    MPI_Send(&suma_parcial, 1, MPI_INT, 0,0,MPI_COMM_WORLD);
    std::printf("Suma Parcial: %d, rank %d  \n", suma_parcial,rank);
}

    MPI_Finalize();
    return (0);
}