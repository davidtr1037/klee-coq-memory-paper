entry:
  %a = call i8* @malloc(i64 10) /*@ \label{line:overview-llvm-malloc} @*/
  %d = udiv i32 %n, 2
  br i1 (icmp eq i32 %d, 4), label %then, label %else /*@ \label{line:overview-llvm-br} @*/
then:
  %p = getelementptr i8, i8* %a, i32 %n /*@ \label{line:overview-llvm-gep} @*/
  store i8 7, i8* %p /*@ \label{line:overview-llvm-store} @*/
  br label %else
else:
  ret void
