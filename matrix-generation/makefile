NVCC=nvcc
CUDAFLAGS=-arch=sm_70
RM=/bin/rm -f

all: main

main: generation_main.o generation_caller.o generation.o
	g++ generation_main.o generation_caller.o generation.o -o main -L/usr/local/cuda/lib64 -lcuda -lcudart

generation_main.o: generation_main.cpp
	g++ -std=c++11 -c generation_main.cpp

generation_caller.o: generation_caller.cpp
	g++ -std=c++11 -c generation_caller.cpp

generation.o: generation.cu
	${NVCC} ${CUDAFLAGS} -c generation.cu

clean:
	${RM} *.o main