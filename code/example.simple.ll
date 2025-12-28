define i32 @main() {
entry:
  %p = call i8* @malloc(i64 2)
  %n = call i32 @make_symbolic()
  %cmp1 = icmp ult i32 %n, 2
  call void @assume_bool(i1 %cmp1)
  %gep1 = getelementptr nuw i8, i8* %p, i64 0
  store i8 7, i8* %gep1
  %idx = zext i32 %n to i64
  %gep2 = getelementptr nuw i8, i8* %p, i64 %idx
  %v = load i8, i8* %gep2
  %conv = sext i8 %v to i32
  %cmp2 = icmp eq i32 %conv, 7
  br i1 %cmp2, label %if.then, label %if.else
if.then:
  br label %return
if.else:
  br label %return
return:
  %r = phi i32 [ 1, %if.then ], [ 0, %if.else ]
  ret i32 %r
}
