#include <klee/klee.h>
#include <stdint.h>
#include <stdlib.h>

int main() {
    char *a = malloc(10);
    unsigned n = klee_make_symbolic_int32();
    klee_assume(n < 10);
    a[n] = 7;
    return 0;
}
