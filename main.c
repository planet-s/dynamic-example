#include <stdio.h>
#include "factorial.h"

int main(int argc, char **argv) {
    unsigned long x = 10;
    printf("%lu! = %lu\n", x, factorial(x));
}
