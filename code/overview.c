#include <klee/klee.h>
#include <stdint.h>
#include <stdlib.h>

void f(unsigned n) {
    char *a = malloc(10);
    if (n / 2 == 4) {
        a[n] = 7;
    }
}
