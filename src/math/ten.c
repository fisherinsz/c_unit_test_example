#include <ten.h>
#include <add2.h>
#include <stdio.h>

int ten_times(int j)
{
  printf("\ncall ten_times\n");
  return add2(j*10);
}