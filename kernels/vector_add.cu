#include <stdio.h>
#include <cuda_runtime.h>
#include <cuda_runtime.h>

/* Simple C macro to check CUDA errors */
#define CHECK_CUDA(call)                                       \
    do {                                                       \
        cudaError_t err = (call);                              \
        if (err != cudaSuccess) {                              \
            fprintf(stderr,                                    \
                "CUDA error at %s:%d: %s\n",                   \
                __FILE__, __LINE__, cudaGetErrorString(err));  \
            exit(EXIT_FAILURE);                                \
        }                                                      \
    } while (0)

__global__
void vectorAdd(int *A, int *B, int *C, int numElements){

    //compute the threads global index for 1D grid of 1D rows essentially [block1, block2, ...]
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    
    if(i < numElements){ //prevent out of bound access
        C[i] = A[i] + B[i]; //each thread will do its own globally indexed addition
    }
    
}

int main(){
    int numElements = 8;
    //create pointer A that points to the start of an integer array that is numElements size
    int *A = (int*)malloc(numElements *sizeof(int));
    int *B = (int*)malloc(numElements *sizeof(int));
    int *C = (int*)malloc(numElements *sizeof(int));
    if(A == NULL || B == NULL || C == NULL){
        printf("Memory allocation failed\n");
        exit(0);
    }

    for(int i = 0; i < numElements; i++){
        A[i] = i;
        B[i] = i * 2;
    }

    for (int i = 0; i < numElements; i++){
        printf("A[%d] = %d B[%d] = %d \n", i, A[i], i, B[i]);
    }

    free(A);
    free(B);
    free(C);
}