#include <stdio.h>
#include <CUnit/CUnit.h>
#include <cal.h>
#include <ten.h>
#include <test_cal.h>

void test_ten_times(void)
{
    CU_ASSERT(ten_times(2) == 22);
    CU_ASSERT(ten_times(0) == 2);
    CU_ASSERT(ten_times(-1) == -8);
}