#include "generation_header.cuh"
#include "device_launch_parameters.h"
//#include "cuda.h"
#include "cuda_runtime.h"

__global__ void cuda_global(int *dev_a)
{
  if (threadIdx.x < 1)
  {
    dev_a[0] = 0;
  }
}
//generate N x N array
std::array<std::array<int, N>, N> generateArray()
{
  std::default_random_engine engine{};
  std::uniform_int_distribution randomNumbers{-9, 9};
  std::array<std::array<int, N>, N> a{};
  for(int i = 0; i < N; i++)
  {
    for(int j = 0; j < N; j++)
    {
      a[i][j] = randomNumbers(engine);
    }
  }
  return a;
}


//print N x N matrix
void printArray(std::array<std::array<int, N>, N>& a)
{
  // loop through array's rows
  for (const auto& row : a)
  {
    // loop through columns of current row
    for (const auto& element : row)
    {
      if(element >= 0)
        std::cout << ' ' << element << ' ';
      else
        std::cout << element << ' ';
    }
    std::cout << '\n'; // start new line of output
  }
}

void wrapper()
{
  printf("STAGE 3 WRAPPER START\n");
  std::array<std::array<int, N>, N> a = generateArray();
  printArray(a);
  /*
  int *dev_a;
  cudaMalloc((void**)&dev_a, CUDASIZE*sizeof(int));
  cudaMemcpy(dev_a, a, CUDASIZE*sizeof(int), cudaMemcpyHostToDevice);
  cuda_global<<<BLOCKS, THREADS>>>(dev_a);
  cudaMemcpy(a, dev_a, sizeof(int), cudaMemcpyDeviceToHost);
  cudaFree(dev_a);
*/
  printf("STAGE 3 WRAPPER END\n");
}