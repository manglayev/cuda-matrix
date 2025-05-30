#include <array>
#include <iostream>
#include <utility>
#include <type_traits>
#include <stdio.h>
#include <stdlib.h>
#include <random>
/*
The size of square array must be equal to the multiplication of the number of threads to the number of blocks
THREADS x BLOCKS = CUDASIZE
N x N  = CUDASIZE
*/

#define DIMS 1
/*
#define BLOCKS 4
#define THREADS 8
#define CUDASIZE 32
*/

#define THREADS 32
#define BLOCKS 8
#define CUDASIZE 256
#define N 16
extern void caller();
extern void wrapper();
//extern int checkResults(int *a);
//extern int* initArray();
extern std::array<int, N> generateArray();
//void printArray(std::array<std::array<int, N>, N>& a);
