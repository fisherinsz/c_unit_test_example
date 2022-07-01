# It is a simple demo to show how to mock on c
In unit test, the hardest work is to 'Mock' functions to isolated the tests. For example, you want to test function A, but in function A, it call B, and B call C, when do unit test on A, you don't want the B & C functions to impact your test on A. To isolated the B & C from A function test, you can use C language's link option: [--wrap](https://sourceware.org/binutils/docs/ld/Options.html)
This project demo how to do mock in this way. Put your commits, if you have any good idea.
# How to run
download it, and run ./run.sh 
# Modify and Fix the test
In file ten.c, try to do the following changes, and rerun the  test by:  ./run.sh -t
``
  // return j*10;
  return add2(j*10);
``
What happend? some test faild, why fail? how to fix it?
Why the test on foo (test_foo) not fail?