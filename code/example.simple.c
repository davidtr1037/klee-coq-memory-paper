int main() {
  char *p = malloc(2); /*@ \label{line:example-malloc} @*/
  unsigned n = make_symbolic();
  assume(n < 2);
  p[0] = 7; /*@ \label{line:example-store} @*/
  if (p[n] == 7) {
    return 1;
  } else {
    return 0;
  }
}
