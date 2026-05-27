%a = call i8* @malloc(i64 10)
%p = getelementptr i8, i8* %a, i64 %n
store i8 7, i8* %p
