; ModuleID = 'example.bc'
source_filename = "example.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %call = call noalias align 16 i8* @malloc(i64 4) #4, !dbg !13
  call void @llvm.dbg.value(metadata i8* %call, metadata !14, metadata !DIExpression()), !dbg !17
  %call1 = call i32 @klee_make_symbolic_int32(), !dbg !18
  call void @llvm.dbg.value(metadata i32 %call1, metadata !19, metadata !DIExpression()), !dbg !17
  %cmp = icmp ult i32 %call1, 4, !dbg !21
  call void @klee_assume_bool(i1 zeroext %cmp), !dbg !22
  %arrayidx = getelementptr inbounds i8, i8* %call, i64 1, !dbg !23
  store i8 7, i8* %arrayidx, align 1, !dbg !24
  %idxprom = zext i32 %call1 to i64, !dbg !25
  %arrayidx2 = getelementptr inbounds i8, i8* %call, i64 %idxprom, !dbg !25
  %0 = load i8, i8* %arrayidx2, align 1, !dbg !25
  %conv = sext i8 %0 to i32, !dbg !25
  %cmp3 = icmp eq i32 %conv, 7, !dbg !27
  br i1 %cmp3, label %if.then, label %if.else, !dbg !28

if.then:                                          ; preds = %entry
  br label %return, !dbg !29

if.else:                                          ; preds = %entry
  br label %return, !dbg !31

return:                                           ; preds = %if.else, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %if.else ], !dbg !33
  ret i32 %retval.0, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i32 @klee_make_symbolic_int32() #3

declare dso_local void @klee_assume_bool(i1 zeroext) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "example.c", directory: "/home/david/research/verified-se/klee-coq-memory-paper/code")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.1"}
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !10, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocation(line: 6, column: 15, scope: !9)
!14 = !DILocalVariable(name: "p", scope: !9, file: !1, line: 6, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocation(line: 0, scope: !9)
!18 = !DILocation(line: 7, column: 18, scope: !9)
!19 = !DILocalVariable(name: "n", scope: !9, file: !1, line: 7, type: !20)
!20 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!21 = !DILocation(line: 8, column: 24, scope: !9)
!22 = !DILocation(line: 8, column: 5, scope: !9)
!23 = !DILocation(line: 9, column: 5, scope: !9)
!24 = !DILocation(line: 9, column: 10, scope: !9)
!25 = !DILocation(line: 10, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !9, file: !1, line: 10, column: 9)
!27 = !DILocation(line: 10, column: 14, scope: !26)
!28 = !DILocation(line: 10, column: 9, scope: !9)
!29 = !DILocation(line: 11, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !1, line: 10, column: 20)
!31 = !DILocation(line: 13, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !26, file: !1, line: 12, column: 12)
!33 = !DILocation(line: 0, scope: !26)
!34 = !DILocation(line: 15, column: 1, scope: !9)
