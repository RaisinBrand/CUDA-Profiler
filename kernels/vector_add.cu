#include <stdio.h>
#include <cuda_runtime.h>
#include <helper_cuda.h>

void vectorAdd(int *A, int *B, int *C, int numElements){

    //probably check that the sizes are different
    
    //now that are same sizes 
}

int main(){
    int numElements = 1024;
    //create pointer A that points to the start of an integer array that is numElements size
    int *A = (int*)malloc(numElements *sizeof(int))
    int *B = (int*)malloc(numElements *sizeof(int))
    

}