#include <stdio.h>
#include <CUnit/CUnit.h>
#include <cal.h>
#include <ten.h>
#include <test_cal.h>
static int moke_ten_times=0;
static int call_time=0;

int __wrap_ten_times(int i)
{
  if(moke_ten_times > 0) {
    printf("\ncall ten_times in mock in %d\n",call_time++);
    return i*100;
  } else {
    return __real_ten_times(i);
  }
}

void test_foo(void)
{
  moke_ten_times = 1;
  CU_ASSERT(foo(2) == 201);
  CU_ASSERT(foo(0) == 1);
  CU_ASSERT(foo(-1) == -99);
  moke_ten_times = 0;
}
