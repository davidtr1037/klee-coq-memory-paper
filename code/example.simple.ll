define i32 @main() {
entry:
  %call = call i8* @malloc(i64 2)
  %call1 = call i32 @klee_make_symbolic_int32()
  %cmp = icmp ult i32 %call1, 2
  call void @klee_assume_bool(i1 %cmp)
  %arrayidx = getelementptr nuw i8, i8* %call, i64 1
  store i8 7, i8* %arrayidx
  %idxprom = zext i32 %call1 to i64
  %arrayidx2 = getelementptr nuw i8, i8* %call, i64 %idxprom
  %0 = load i8, i8* %arrayidx2
  %conv = sext i8 %0 to i32
  %cmp3 = icmp eq i32 %conv, 7
  br i1 %cmp3, label %if.then, label %if.else
if.then:
  br label %return
if.else:
  br label %return
return:
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %if.else ]
  ret i32 %retval.0
}
