#include <stdio.h>
#include <cal.h>
#include "pool/thpool.h"


void task(void *arg){
	printf("Thread #%u working on %d\n", (int)pthread_self(), (int) arg);
}

#ifdef LIME_UNIT_TEST
// do nothing here
#else
int main()
{
    printf("\nfoo is %d\n", foo(10));
    
    puts("Making threadpool with 4 threads");
	threadpool thpool = thpool_init(4);

	puts("Adding 40 tasks to threadpool");
	int i;
	for (i=0; i<400000; i++){
		thpool_add_work(thpool, task, (void*)(int)i);
	};

	thpool_wait(thpool);
	puts("Killing threadpool");
	thpool_destroy(thpool);
	return 0;
}
#endif