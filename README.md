# It is a simple demo to show how to mock on c
In unit test, the hardest work is to 'Mock' functions to isolated the tests. For example, you want to test function A, but in function A, it call B, and B call C, when do unit test on A, you don't want the B & C functions to impact your test on A. To isolated the B & C from A function test, you can use C language's link option: [--wrap](https://sourceware.org/binutils/docs/ld/Options.html)
This project demo how to do mock in this way. Put your commits, if you have any good idea.
# How to run
download it, and run ./run.sh 