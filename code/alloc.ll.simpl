%n1 = add i64 4294967295, 1
%n2 = add i64 %n1, 10
%p1 = call i8* @malloc(i64 %n2) /*@ \label{line:issue-llvm-malloc} @*/
%n3 = add i64 4294967295, 1
%p2 = getelementptr i8, i8* %p1, i64 %n3/*@ \label{line:issue-llvm-gep} @*/
store i8 1, i8* %p2/*@ \label{line:issue-llvm-store} @*/
