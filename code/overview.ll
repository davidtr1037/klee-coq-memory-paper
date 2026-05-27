; ModuleID = 'overview.bc'
source_filename = "overview.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %p = alloca i8*, align 8
  %n = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8** %p, metadata !13, metadata !DIExpression()), !dbg !16
  %call = call noalias align 16 i8* @malloc(i64 10) #4, !dbg !17
  store i8* %call, i8** %p, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata i32* %n, metadata !18, metadata !DIExpression()), !dbg !20
  %call1 = call i32 @klee_make_symbolic_int32(), !dbg !21
  store i32 %call1, i32* %n, align 4, !dbg !20
  %0 = load i32, i32* %n, align 4, !dbg !22
  %cmp = icmp ult i32 %0, 10, !dbg !23
  %conv = zext i1 %cmp to i32, !dbg !23
  %conv2 = sext i32 %conv to i64, !dbg !22
  call void @klee_assume(i64 %conv2), !dbg !24
  %1 = load i8*, i8** %p, align 8, !dbg !25
  %2 = load i32, i32* %n, align 4, !dbg !26
  %idxprom = zext i32 %2 to i64, !dbg !25
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 %idxprom, !dbg !25
  store i8 7, i8* %arrayidx, align 1, !dbg !27
  ret i32 0, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i32 @klee_make_symbolic_int32() #3

declare dso_local void @klee_assume(i64) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !10, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "p", scope: !9, file: !1, line: 5, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocation(line: 5, column: 11, scope: !9)
!17 = !DILocation(line: 5, column: 15, scope: !9)
!18 = !DILocalVariable(name: "n", scope: !9, file: !1, line: 6, type: !19)
!19 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!20 = !DILocation(line: 6, column: 14, scope: !9)
!21 = !DILocation(line: 6, column: 18, scope: !9)
!22 = !DILocation(line: 7, column: 17, scope: !9)
!23 = !DILocation(line: 7, column: 19, scope: !9)
!24 = !DILocation(line: 7, column: 5, scope: !9)
!25 = !DILocation(line: 8, column: 5, scope: !9)
!26 = !DILocation(line: 8, column: 7, scope: !9)
!27 = !DILocation(line: 8, column: 10, scope: !9)
!28 = !DILocation(line: 9, column: 5, scope: !9)
