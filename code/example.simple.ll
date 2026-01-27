%p = call i8* @malloc(i64 2) /*@ \label{line:llvm-malloc} @*/
%n = call i32 @make_symbolic()
%cmp1 = icmp ult i32 %n, 2
call void @assume_bool(i1 %cmp1)
%gep1 = getelementptr nuw i8, i8* %p, i64 0
store i8 7, i8* %gep1/*@ \label{line:llvm-store} @*/
%idx = zext i32 %n to i64
%gep2 = getelementptr nuw i8, i8* %p, i64 %idx /*@ \label{line:llvm-gep} @*/
%v = load i8, i8* %gep2 /*@ \label{line:llvm-load} @*/
...
