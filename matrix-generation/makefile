NVCC=nvcc
CUDAFLAGS=-arch=sm_70
RM=/bin/rm -f

all: main

main: main.o caller.o generation.o
	g++ main.o caller.o generation.o -o main -L/usr/local/cuda/lib64 -lcuda -lcudart

main.o: main.cpp
	g++ -std=c++11 -c main.cpp

caller.o: caller.cpp
	g++ -std=c++11 -c caller.cpp

generation.o: generation.cu
	${NVCC} ${CUDAFLAGS} -c generation.cu

clean:
	${RM} *.o main