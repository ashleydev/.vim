" Syntax file for coloring the output of rfsd logs, rfsd tests, and the like

if exists("b:current_syntax")
  finish
endif

"===============================================================================
" Error:
"===============================================================================

syntax match ErrorWords                "ERRORS\|ERROR\|errors\|error\|Errors\|Error"
highlight    ErrorWords                   cterm=bold ctermfg=Red

syntax match DumpingCore                ".*dumping core"
highlight    DumpingCore                   cterm=bold ctermfg=Red


"===============================================================================
" Log Message Intro:
"===============================================================================
"  EXAMPLE LOG:
" [08:13:51.744554 8484 (8616) error /evicter] evict_next: list empty; nothing to evict
" [08:13:56.746815 8484 (8616) info  /evicter] % used=94% > max_used_pct-offset=90%; offset=0 should evict slab
" [08:14:00.479646 8484 (8488) info  /rfsd] shutdown signal received
" [08:14:00.771850 8484 (8487) info  /ctl] ctl thread exiting

syntax match   LogMsgIntroBrackets      contained   "[\[\]]"
highlight      LogMsgIntroBrackets        ctermfg=Yellow

syntax region  LogMsgIntroTime   start="\d\d:" skip="[0-9.:]" end=" " contained contains=LogMsgTimeDigits display 
syntax match   LogMsgTimeDigits         contained   "\d\+"
highlight      LogMsgTimeDigits          ctermfg=200
highlight      LogMsgIntroTime           ctermfg=246

syntax match   LogMsgIntroBrackets      contained   "[\[\]]"
highlight      LogMsgIntroBrackets        ctermfg=darkYellow

syntax match   LogMsgIntroPid           contained   "\d\+ "
highlight      LogMsgIntroPid             ctermfg=52

syntax region  LogMsgIntroThreadPid     contains=LogMsgThreadPid contained display  start="(" end=")"
highlight      LogMsgIntroThreadPid       ctermfg=19

syntax match   LogMsgThreadPid          contained   "\d\+"
highlight      LogMsgThreadPid            ctermfg=52 cterm=underline

syntax match   LogMsgIntroPath          contained display "/[^\]]\+"
highlight      LogMsgIntroPath            ctermfg=darkgreen

" Log Levels:
syntax case ignore
syntax keyword LogMsgIntroLevelEmerg   contained   emerg[ency]
syntax keyword LogMsgIntroLevelAlert   contained   alert
syntax keyword LogMsgIntroLevelCrit    contained   crit[ical]
syntax keyword LogMsgIntroLevelError   contained   err[or]
syntax keyword LogMsgIntroLevelWarn    contained   warn[ing]
syntax match   LogMsgIntroLevelWarn2   contained   " warn"
syntax keyword LogMsgIntroLevelNote    contained   note notice
syntax keyword LogMsgIntroLevelInfo    contained   info
syntax keyword LogMsgIntroLevelDebug   contained   debug
syntax case match
highlight      LogMsgIntroLevelEmerg     ctermfg=Yellow   ctermbg=Red       cterm=bold
highlight      LogMsgIntroLevelAlert     ctermfg=Yellow   ctermbg=Red       cterm=bold
highlight      LogMsgIntroLevelCrit      ctermfg=Yellow   ctermbg=Red       cterm=bold
highlight      LogMsgIntroLevelError     ctermfg=Red      cterm=bold
highlight      LogMsgIntroLevelWarn      ctermfg=208      cterm=underline
highlight      LogMsgIntroLevelWarn2     ctermfg=208      cterm=underline
highlight      LogMsgIntroLevelNote      ctermfg=DarkYellow
highlight      LogMsgIntroLevelDebug     ctermfg=Cyan

syntax region  LogMsgIntro       contains=LogMsgIntro.\+ keepend start="^\["   skip="[^\]]"   end="]"

"===============================================================================
" g++4 to see what make is doing:
"===============================================================================

syntax match  GCC                       "^/usr/bin/g++4"
highlight     GCC                        cterm=underline


"===============================================================================
" Unit Tests Results:
"===============================================================================

syntax match TestCompletedSuccess       "^Test \S\+ completed successfully!.*"
highlight    TestCompletedSuccess        ctermbg=Green ctermfg=Black

syntax match TestCompletedError         "^ERROR: test .* failed"
highlight    TestCompletedError          ctermbg=Red

syntax match Testing                    "Running tests .*"
highlight    Testing                     ctermbg=Yellow ctermfg=Black


"===============================================================================
" Assignment:
"===============================================================================

syntax match AssignmentRHS             contained "\s*[^= %:);,]\+"
highlight    AssignmentRHS              cterm=bold  ctermfg=Magenta
syntax match AssignmentLHS             contained "[^=! (]\+\s*="he=e-1
highlight    AssignmentLHS              cterm=bold  ctermfg=Cyan
syntax match Assignment                contains=Assignment.\+ display "[^=! (,]\+\s*=\s*[^= %:);,]*"


"===============================================================================
" Flamebox Ignore Lines:
"===============================================================================

syntax match FlameboxIgnore            display "^flamebox-ignore.*"             contains=FlameboxIgnoreCancel 
highlight    FlameboxIgnore               ctermfg=19

syntax match FlameboxIgnoreCancel      contained "cancel"
highlight    FlameboxIgnoreCancel         ctermfg=19 cterm=bold,underline


"===============================================================================
" Stacktrace:
"===============================================================================

syntax match StackTraceHex                 contained "0x[0-9a-fA-F]\+"
highlight    StackTraceHex                    ctermfg=20
syntax match StackTraceFrameNumHash        contained "^#"
highlight    StackTraceFrameNumHash           ctermfg=20
syntax match StackTraceFrameNum            contained "^#\d\+"hs=s+1             contains=StackTraceFrameNumHash
highlight    StackTraceFrameNum               cterm=Bold
syntax match StackTraceAddress             contained "^#\d\+ \+0x[0-9a-fA-F]\+" contains=StackTraceFrameNum
highlight    StackTraceAddress                ctermfg=DarkRed
syntax match StackTraceFunction            contained " in .[^( ]\+"hs=s+4
syntax match StackTraceIn                  contained " in "
highlight    StackTraceIn                     ctermfg=Yellow
syntax match StackTraceFunctionArgsParens  contained "[()]"
highlight    StackTraceFunctionArgsParens     cterm=Bold
syntax match StackTraceFunctionArgs        contained "\( \)\@<!\(()\)\?([^)]*)" contains=StackTraceFunctionArgsParens
highlight    StackTraceFunctionArgs           ctermfg=Green
syntax match StackTraceAt                  contained " at "
highlight    StackTraceAt                     ctermfg=Yellow
syntax match StackTraceFile                contained " at [^: ]*"hs=s+4         contains=StackTraceAt
highlight    StackTraceFile                   ctermfg=200
syntax match StackTraceFileNumber          contained ":\d\+$"hs=s+1
highlight    StackTraceFileNumber             ctermfg=200 cterm=Underline

syntax region StackTrace               start="^#\d\+ \+" end="$"        keepend contains=StackTrace.\+ 

"===============================================================================
let b:current_syntax = "rfsd"
