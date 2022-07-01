#include <stdio.h>
#include <CUnit/CUnit.h>
#include <cal.h>
#include <ten.h>
#include <add2.h>
#include <test_cal.h>

void test_add2(void)
{
    CU_ASSERT(add2(2) == 4);
    CU_ASSERT(add2(0) == 2);
    CU_ASSERT(add2(-1) == 1);
}