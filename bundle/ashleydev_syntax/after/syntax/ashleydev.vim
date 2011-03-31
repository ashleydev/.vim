" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ashley Dev
" Last Change:	06/04/09

hi clear
set background=dark
if exists("syntax_on")
"   syntax reset
endif
let g:colors_name = "ashleydev"
hi Normal		  guifg=#BEBEBE  guibg=black
hi Scrollbar	  guifg=darkcyan guibg=cyan
hi Menu			  guifg=#BEBEBE guibg=black
hi SpecialKey	  term=bold  cterm=bold  ctermfg=darkred  guifg=Blue
hi NonText		  term=bold  cterm=bold  ctermfg=darkred  gui=bold	guifg=Blue
hi Directory	  term=bold  cterm=bold  ctermfg=brown	guifg=Blue
hi ErrorMsg		  term=standout  cterm=bold  ctermfg=grey  ctermbg=blue  guifg=White  guibg=Red
hi Search		  term=reverse	ctermfg=white  ctermbg=red	guifg=black  guibg=#ffff00
hi MoreMsg		  term=bold  cterm=bold  ctermfg=darkgreen	gui=bold  guifg=SeaGreen
hi ModeMsg		  term=bold  cterm=bold  gui=bold  guifg=White
hi LineNr		  term=underline  cterm=bold  ctermfg=darkred	guifg=Red
hi Question		  term=standout  cterm=bold  ctermfg=darkgreen	gui=bold  guifg=Green
hi StatusLine	  term=bold,reverse  cterm=bold ctermfg=lightblue ctermbg=white gui=bold guifg=black guibg=#BEBEBE
hi StatusLineNC   term=reverse	ctermfg=white ctermbg=lightblue guifg=white guibg=blue
hi Title		  term=bold  cterm=bold  ctermfg=darkmagenta  gui=bold	guifg=Magenta
hi Visual		  term=reverse	cterm=reverse  gui=reverse
hi WarningMsg	  term=standout  cterm=bold  ctermfg=darkblue  guifg=Red
hi Cursor		  guifg=bg	guibg=Green
hi Comment		  term=bold  cterm=bold ctermfg=cyan  guifg=cyan
hi cComment		  term=bold  cterm=bold ctermfg=cyan  guifg=darkcyan gui=bold
hi String		  term=underline  cterm=bold ctermfg=magenta  guifg=#ff00ff 
hi Constant		  term=underline  cterm=bold ctermfg=magenta  guifg=red gui=bold
hi Special		  term=bold  cterm=bold ctermfg=red  guifg=#ff0055 gui=italic
hi Statement	  guifg=#ffff90
hi PreProc		  term=underline  ctermfg=darkblue	guifg=#5C5CFF
hi Identifier	  term=underline   ctermfg=brown  guifg=#00ffff gui=bold
hi Type			  term=underline  cterm=bold ctermfg=lightgreen  gui=bold  guifg=#00ff00
hi Error		  term=reverse	ctermfg=darkcyan  ctermbg=black  guifg=Red	guibg=Black
hi Todo			  term=standout  ctermfg=black	ctermbg=darkcyan  guifg=Blue  guibg=Yellow
hi link IncSearch		Visual
hi link String			Constant
hi link Character		Constant
hi link Number			Constant
hi link Boolean			Constant
hi link Float			Number
hi link Function		Identifier
hi link Conditional		Statement
hi link Repeat			Statement
hi link Label			Statement
hi link Operator		Statement
hi link Keyword			Statement
hi link Exception		Statement
hi link Include			PreProc
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special

