#include <cal.h>
#include <ten.h>
#include <stdio.h>

int foo(int i)
{
//   printf("call foo\n");
  ten_times(i);
  return ten_times(i)+1;
}
