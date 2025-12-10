#include <stdio.h>
#include <stdlib.h>
#include <klee/klee.h>

int main() {
    char *p = malloc(2); /*@ \label{line:example-malloc} @*/
    unsigned n = klee_make_symbolic_int32(); /*@ \label{line:example-make-symbolic} @*/
    klee_assume_bool(n < 2); /*@ \label{line:example-assume} @*/
    p[0] = 7;
    if (p[n] == 7) {
        return 1; 
    } else {
        return 0;
    }
}
