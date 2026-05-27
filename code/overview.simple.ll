%p = call noalias align 16 i8* @malloc(i64 10)
%n = call i32 @klee_make_symbolic_int32()
%i = zext i32 %n to i64
%gep = getelementptr inbounds i8, i8* %p, i64 %i
store i8 7, i8* %gep
