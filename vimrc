filetype on
syntax on
"set syntax=ashleydev

set nocompatible
set confirm
set autoindent
set autowrite
set number
set mouse=a
set title
set esckeys
set backspace=indent,eol,start
set nobackup
set magic
set laststatus=2  "always put a status line at the bottem of the window.
set noerrorbells
set visualbell
set ruler
set showcmd
set showfulltag
set scrolloff=2             " cursors stays 2 lines below/above top/bottom
"set updatecount=50 updatetime=3600000      " saves power on notebooks
set updatetime=400  "this makes Tlist update which function you are in much faster.
set history=50
set formatoptions=cqrt
set hlsearch
set incsearch
set nolist
set listchars=tab:»·,trail:·
" set listchars=tab:>-,trail:+
set whichwrap=<,>,h,l,[,]

set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set smarttab
set wrap
set linebreak
set smartcase
set infercase
set textwidth=80

set foldmethod=manual

let loaded_matchparen = 1 "Don't load the match paren plugin, I don't like it.

"set pastetoggle=<F12>
set stl=%t%y%r%m%=line\ %l\ of\ %L,\ col\ %c,\ %p%%
set comments=b:#,:%,://,fb:-,n:>,n:),s1:/*,mb:*,ex:*/

let mapleader=","

" strip all trailing whitespace 
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" clear current search
nnoremap <leader><space> :nohlsearch<cr>
" use tab keys to match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" Y to yank from the cursor to the end of the line.
map Y y$

" These commands deal with changing and minimizing windows up and down.
set winminheight=0
map  <C-J> <C-W>j<C-W>_
map  <C-K> <C-W>k<C-W>_

" move to window left/right and maximize
set winminwidth=0
nmap <Leader>h <C-W>h500<C-W>>
nmap <Leader>l <C-W>l500<C-W>>

" create a new tab
nmap <Leader>t :tabnew<CR>
" move to tab right/left
nmap <Leader>k gt
nmap <Leader>j gT

nmap <C-H> :set wrap!<bar>set wrap?<CR>
nmap <C-P> :set paste!<bar>set paste?<CR>
nmap <C-N> :set number!<bar>set number?<CR>

" previous buffer
map  <F7>  :bp<CR>
" next buffer
map  <F8>  :bn<CR>
" turn off vimdiff mode
map  <F9>  :set noscrollbind<bar>set foldcolumn=0<bar>set nodiff<bar>set foldmethod=manual<CR>
" toggle search highlighting
map  <F10> :set hls!<bar>set hls?<CR>
nmap <F12> :set mouse=a<bar>set nopaste<bar>set mouse?<CR>
nmap <S-F12> :set mouse=<bar>set paste<bar>set mouse?<CR>
 
inoremap <MiddleMouse> <C-O>:set paste<cr><MiddleMouse><C-O>:set nopaste<CR>

" make <c-g> more verbose
nnoremap <c-g> 2<c-g>

" So, hitting '*' while in visual mode does a search on everything that
" matches the currently selected area. Of course, this does not work
" with multi-line selections.
vnoremap * <esc>:let save_reg=@"<cr>gvy:let @/=@"<cr>:let @"=save_reg<cr>/<cr>
vnoremap # <esc>:let save_reg=@"<cr>gvy:let @/=@"<cr>:let @"=save_reg<cr>?<cr>

" for ins-completion shortcuts:
inoremap <c-]> <c-X><c-]>
inoremap <c-F> <c-X><c-F>
inoremap <c-D> <c-X><c-D>
inoremap <c-L> <c-X><c-L>

inoremap <silent> <s-tab> <c-x><c-o><c-p>

"make tag goto open in a different window when clicking on it with the mouse
map <C-LeftMouse> <LeftMouse><C-Space>g
map g<LeftMouse> <LeftMouse><C-Space>g

" paste in visual mode works:
vmap p d"0P

iab Ydate <C-R>=strftime("%m/%d/%y")<CR>
  " Example: 8/16/00
iab Ytime <C-R>=strftime("%H:%M")<CR>
  " Example: 14:28
iab Ydt   <C-R>=strftime("%m/%d/%y %T")<CR>
  " Example: 971027 12:00:00
iab Ystamp <C-R>=strftime("%a %b %d %T %Z %Y")<CR>
  " Example: Tue Dec 16 12:07:00 CET 1997

iab teh the
iab tehy they
iab durring during
iab untill until
iab allways always

" catch typos for :wq
cmap Wq wq
cmap WQ wq

" Set quick escape from insert mode
imap jj <esc>
imap Jj <esc>
imap jJ <esc>
imap JJ <esc>

" using the Align() function from plugin/Align_on_char.vim -- within highlighted
" lines, Align() will allign all occurances of some "<string>" to a the same
" column inserting spaces where needed to create the alignment.
vmap <C-L> :Align "="<CR>
vmap <C-K> :Align ":"<CR>

" open a quick fix window whenever there is something to put in it.
:cwindow

" put cscope results in a quick fix window.
" set csqf=s-,c-,d-,i-,t-,e-

match todo /@@@/

" EMACS LIKE MAPPINGS FOR THE INSERT MODE
"  scroll up
"inoremap         
"  scroll down
"inoremap         
"  END OF LINE
"   note: this conflicts with copying the line above (normal vim  in insert mode)
"inoremap         <End>
"  START OF LINE
"inoremap         <Home>

set cindent
"set    cinkeys=0{,0},:,!,o,O,e
"set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,ps,t0,+s,(0,u0,)20,*30,g0
set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,ps,t0,+s,(s,us,)20,*30,g0

set switchbuf=useopen
if version < 600
    set shortmess=astI
endif
set complete=.,w,b,u,t,i

" the following lines will enable
" item comments.  I'm not sure how though...
set fo+=crq2b
set com& " reset to default
set com^=sr:*\ -,mb:*\ \ ,el:*/ com^=sr://\ -,mb://\ \ ,el:///

set path=.,~/include,/usr/local/include,/usr/include,/usr/include/g++-3,/usr/X11R6/include/,/usr/lib/gcc-lib/i386-linux/2.95.2/include

if isdirectory(expand("/usr/include/CC/"))
    set path+=/usr/include/CC
endif

set tags=./tags,../tags,../../tags,../../../tags
set wildignore=*.o,*.r,*.so,*.tar,*.tgz
set wildmode=list:longest,list:full

"-------------------------------------------------------------------------
" taglist plugin:
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
nmap T :TlistToggle<CR>

"-------------------------------------------------------------------------
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  au FileType text setlocal tw=78

  " When editing a file, always jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Git
  autocmd BufNewFile,BufRead *.git/COMMIT_EDITMSG    set ft=gitcommit
  autocmd BufNewFile,BufRead *.git/config,.gitconfig set ft=gitconfig
  autocmd BufNewFile,BufRead git-rebase-todo         set ft=gitrebase
  autocmd BufNewFile,BufRead .msg.[0-9]*
        \ if getline(1) =~ '^From.*# This line is ignored.$' |
        \   set ft=gitsendemail |
        \ endif
  autocmd BufNewFile,BufRead *.git/**
        \ if getline(1) =~ '^\x\{40\}\>\|^ref: ' |
        \   set ft=git |
        \ endif

  autocmd BufRead,BufNewFile *.t set ft=perl
  autocmd BufRead,BufNewFile *.psgi set ft=perl
  autocmd BufRead,BufNewFile *.m set ft=objc
  autocmd BufRead,BufNewFile *.ejs set ft=html
  autocmd BufRead,BufNewFile *.zsh-theme set ft=zsh
  autocmd BufRead,BufNewFile *.mkd set ft=mkd
  autocmd BufRead,BufNewFile *.markdown set ft=mkd
  autocmd BufRead,BufNewFile *.md set ft=mkd
  autocmd BufRead,BufNewFile *.json set ft=javascript


  autocmd FileType python     call PoundComment()
  autocmd FileType zsh        call PoundComment()
  autocmd FileType perl       call PerlPrepare()
  autocmd FileType cgi        call PoundComment()
  autocmd FileType csh        call PoundComment()
  autocmd FileType sh         call PoundComment()
  autocmd FileType javascript call JavascriptPrepare()
  autocmd FileType vim        call VimComment()
  autocmd FileType html       call HtmlPrepare()
  autocmd FileType php        call HtmlPrepare()
  autocmd FileType make       call MakePrepare()
  autocmd FileType objc       call ObjcPrepare()
  autocmd FileType c          call CPrepare()
  autocmd FileType cpp        call CPrepare()
endif

" Define functions
function! PoundComment()
   map - mx:s/^/# /<CR>/<C-p><C-p><CR>'x
   map _ mx:s/^\s*# \?//<CR>/<C-p><C-p><CR>'x
   set comments=:#
endfunction

function! SlashComment()
   map - mx:s/^/\/\/ /<CR>/<C-p><C-p><CR>'x
   map _ mx:s/^\s*\/\/ \?//<CR>/<C-p><C-p><CR>'x
   set comments=://,fb:-,n:>,n:),s1:/*,mb:*,ex:*/
endfunction

function! VimComment()
   map - mx:s/^/" /<CR>/<C-p><C-p><CR>'x
   map _ mx:s/^\s*" \?//<CR>/<C-p><C-p><CR>'x
   set comments=:\"
endfunction

function! HtmlPrepare()
   source $VIM/html.vim
   set matchpairs+=<:>
   set comments=:<li>
endfunction

function! MakePrepare()
   call PoundComment()
   set  noexpandtab
   set  shiftwidth=8
   set  tabstop=8
   set  softtabstop=8
endfunction

function! JavascriptPrepare()
    call SlashComment()
    set shiftwidth=2
    set tabstop=2
    set softtabstop=2
endfunction

function! ObjcPrepare()
    call SlashComment()
    call CPrepare()
    let loaded_matchparen = 1
endfunction

function! PerlPrepare()
    call PoundComment()
    "get perldocs by pressing 'K'
    noremap K :!perldoc <cword> <bar><bar> perldoc -f <cword><cr>
endfunction

function! CPrepare()
    set tags=~/.tags/system.tags,./tags,../tags,../../tags,../../../tags
    call SlashComment()

    " go to the 'a'lternate file (i.e. the c file or the header file)
    nmap <Leader>a :A<CR>


    " fold function bodies in c
    nmap <F4> ]]V][zf
endfunction

"-------------------------------------------------------------------------
" Things for ConqueTerm
"
" The default here is <F9> but I don't need this option and already use <F9> for
" something else:
let g:ConqueTerm_SendVisKey = ''
" Toggle terminal imput mode - to edit it as if it were a normal text buffer
let g:ConqueTerm_ToggleKey = '<F6>'
let g:ConqueTerm_TERM = 'xterm'
" allow <c-w> to work in insert mode
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_InsertOnEnter = 1

let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_CloseOnEnd = 1

" open a shell with ,s (open it vertically with ,v) (assuming <leader> is ,)
nmap <Leader>s :call conque_term#open($SHELL, ['belowright split'])<CR>
nmap <Leader>v :call conque_term#open($SHELL, ['belowright vsplit'])<CR>

"-------------------------------------------------------------------------
" Terminal Color Settings
highlight Comment       ctermfg=DarkCyan
highlight LineNr        ctermfg=DarkRed

""Try doing some color
"  "Try using 88 colors
  if has("terminfo")
     set t_Co=16
     set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
     set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
   else
     set t_Co=16
      set t_Sf=[3%dm
     set t_Sb=[4%dm
   endif

set background=dark

"-------------------------------------------------------------------------
"
"   (vim)diff options...
"
set diffopt=iwhite,filler

set diffexpr=MyDiff()
function! MyDiff()
   let opt = ""
   if &diffopt =~ "icase"
"     let opt = opt . "-i "
     let opt = opt . "-wBi "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "-b "
   endif
   silent execute "!diff -a " . opt . v:fname_in . " " . v:fname_new .
    \  " > " . v:fname_out
endfunction


"-------------------------------------------------------------------------
"
"       Menus in console vim
"
"  press F3 to bring up menus in console-vim

if ! has("gui_running")
    set wildmenu wildcharm=<C-Z>
    nmap <F3> :runtime menu.vim<CR>:emenu <C-Z>
endif

"      Font menu
amenu F&ont.&5x7            :set guifont=5x7<CR><C-L>
amenu F&ont.&6x10           :set guifont=6x10<CR><C-L>
amenu F&ont.6x13            :set guifont=6x13<CR><C-L>
amenu F&ont.&7x13           :set guifont=7x13<CR><C-L>
amenu F&ont.&8x13           :set guifont=8x13<CR><C-L>
amenu F&ont.&9x15           :set guifont=9x15<CR><C-L>
amenu F&ont.&10x20          :set guifont=10x20<CR><C-L>
amenu F&ont.&12x24          :set guifont=12x24<CR><C-L>
amenu F&ont.&heabfix        :set guifont=-*-haebfix-medium-r-normal-*-15-*-*-*-*-*-*-*<CR><C-L>
amenu F&ont.&lucida         :set guifont=-*-lucidatypewriter-medium-r-*-*-14-*-*-*-*-*-*-*<CR><C-L>

"      Misc menu
amenu Misc.Remove\ &trailing\ white-space<Tab>F10   :%s/\s\+$//<CR>``
amenu Misc.&Save\ Viminfo                           :set viminfo='7,n./viminfo<CR>:wv<CR>:set viminfo=<CR>
amenu Misc.Toggle\ case\ for\ searching<Tab>F4      :set ignorecase!<CR>:set ignorecase?<CR>
amenu Misc.Toggle\ highlight\ search\ results       :set hlsearch!<CR>:set hlsearch?<CR>
amenu Misc.Spell\ Check\ Menu                       :runtime my/spellcheck.vim<CR>
amenu Misc.All\ Chars\ Menu                         :runtime my/char_menu.vim<CR>

