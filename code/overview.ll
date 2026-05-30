; ModuleID = 'overview.bc'
source_filename = "overview.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @f(i32 %n) #0 !dbg !9 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !13, metadata !DIExpression()), !dbg !14
  %call = call noalias align 16 i8* @malloc(i64 10) #3, !dbg !15
  call void @llvm.dbg.value(metadata i8* %call, metadata !16, metadata !DIExpression()), !dbg !14
  %div = udiv i32 %n, 2, !dbg !19
  %cmp = icmp eq i32 %div, 4, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  %idxprom = zext i32 %n to i64, !dbg !23
  %arrayidx = getelementptr inbounds i8, i8* %call, i64 %idxprom, !dbg !23
  store i8 7, i8* %arrayidx, align 1, !dbg !25
  br label %if.end, !dbg !26

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "overview.c", directory: "/home/david/research/verified-se/klee-coq-memory-paper/code")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)"}
!9 = distinct !DISubprogram(name: "f", scope: !1, file: !1, line: 5, type: !10, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12}
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !DILocalVariable(name: "n", arg: 1, scope: !9, file: !1, line: 5, type: !12)
!14 = !DILocation(line: 0, scope: !9)
!15 = !DILocation(line: 6, column: 15, scope: !9)
!16 = !DILocalVariable(name: "a", scope: !9, file: !1, line: 6, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 7, column: 11, scope: !20)
!20 = distinct !DILexicalBlock(scope: !9, file: !1, line: 7, column: 9)
!21 = !DILocation(line: 7, column: 15, scope: !20)
!22 = !DILocation(line: 7, column: 9, scope: !9)
!23 = !DILocation(line: 8, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !1, line: 7, column: 21)
!25 = !DILocation(line: 8, column: 14, scope: !24)
!26 = !DILocation(line: 9, column: 5, scope: !24)
!27 = !DILocation(line: 10, column: 1, scope: !9)
