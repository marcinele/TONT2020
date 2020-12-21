#include <iostream>
#include <stdlib.h>
#include <time.h>

using namespace std;

int main()
{

	struct timespec ts1, ts2;
	int n = 32;
	int size = n*n; 
	float C[size];
	float A[size];
	float B[size];
	for(int i=0; i<size; i++)
	{
		C[i] = rand()/RAND_MAX;
	}
	for(int i=0; i<size; i++)
	{
		C[i] = rand()/RAND_MAX;
	}
	for(int i=0; i<size; i++)
	{
		B[i] = rand()/RAND_MAX;
	}
	int x = 0;
	clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &ts1);
	int b = 10000;
	while(x < b)
	{
		for (int i = 0; i < n; i++)
		for (int j = 0; j < n; j++) {
			C[i*n + j] = 0;
			for (int k = 0; k < n; k++)
				C[i*n + j] += A[i*n + k]*B[k*n + j];
		}
		x++;
	}
	clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &ts2);
	long res = ts2.tv_nsec - ts1.tv_nsec;
	cout << res << endl;
	long long perf = (n*n*n*2*b)/(res*1e-3);
	cout << "Performance: " << perf << " MFLOPS" << endl;
	return 0;
}