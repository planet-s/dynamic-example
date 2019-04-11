unsigned long factorial(unsigned long x) {
    unsigned long i;
    unsigned long result = 1;
    for (i = 1; i <= x; i++) {
        result = result * i;
    }
    return result;
}
