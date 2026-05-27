/*@\textcolor{commentcolor}{; assume that: 0 $\leq$ n < 10}@*/
%a = call i8* @malloc(i64 10) /*@ \label{line:overview-llvm-malloc} @*/
%p = getelementptr i8, i8* %a, i64 %n /*@ \label{line:overview-llvm-gep} @*/
store i8 7, i8* %p /*@ \label{line:overview-llvm-store} @*/
