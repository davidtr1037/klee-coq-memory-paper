#include <klee/klee.h>
#include <stdlib.h>

int main() {
    char *p = malloc(10);
    unsigned n = klee_make_symbolic_int32();
    klee_assume(n < 10);
    p[n] = 7;
    return 0;
}
