#include <foo.h>
#include <stdio.h>

int __wrap_foo(int i)
{
  printf("call foo in mock");
  return i*10;
}

int foo(int i)
{
  printf("call foo");
  return i;
}

int bar(void)
{
  return foo(1);
}
