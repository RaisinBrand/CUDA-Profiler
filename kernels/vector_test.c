#include <stdio.h>
#include <stdlib.h>

void vectorAdd(int *A, int *B, int *C, int numElements){

    //probably check that the sizes are different

    //now that are same sizes 
    for(int i = 0; i < numElements; i++){
    C[i] = A[i] + B[i];
    }

}

int main(){
    int numElements = 8;
    //create pointer A that points to the start of an integer array that is numElements size
    int *A = (int*)malloc(numElements *sizeof(int));
    int *B = (int*)malloc(numElements *sizeof(int));
    int *C = (int*)malloc(numElements *sizeof(int));

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
    return -1;
    
}