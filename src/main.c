#include <stdio.h>
#include <cal.h>

#ifdef LIME_UNIT_TEST
// do nothing here
#else
int main()
{
    printf("\nfoo is %d\n", foo(10));
	return 0;
}
#endif