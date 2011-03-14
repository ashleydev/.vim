"-----------------------------------------------------------------------------
" [Plugin]: Install plugins
"-----------------------------------------------------------------------------

" I'm using vim-addon-manager, this will automatically ask you to install all of
" the array-list of bundles named below.
"
" Bootstrap it by installing all the files of vim-addon-manager at
" ~/.vim/vam/vim-addon-manager/*
"
" I'm using vim-addon-manager instead of pathogen as it's more featureful and
" requres much less effort when adding new plugins.
" For more on pathogen see:
" http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen
"
" Adding new plugins:
"
" I just look in
" ~/.vim/vam/vim-addon-manager-known-repositories/plugin/vim-addon-manager-known-repositories.vim
" for the name I want and add it to the list below.

set runtimepath+=~/.vim/vam/vim-addon-manager
call scriptmanager#Activate([
\    'snipMate',
\    'Indent_Guides',
\    'Conque_Shell',
\    'cscope_macros',
\    'taglist',
\    'Align294',
\    'vcscommand',
\    'git.zip',
\    'fugitive',
\    'a.vim_-_Alternate_Files_quickly_.c',
\    'surround',
\    'CCTree_-_C_Call-Tree_Explorer',
\    'Command-T',
\    'The_NERD_Commenter',
\    'YankRing',
\    'Gundo',
\ ])

if !exists("*scriptmanager#Activate")
    echo "ERROR: Could not find your plugins\n" .
    \    "\tPlease install vim-addon-manager files at ~/.vim/vam/vim-addon-manager/*\n"
endif

"-----------------------------------------------------------------------------
" appearance
"-----------------------------------------------------------------------------

syntax on

highlight Comment       ctermfg=DarkCyan
highlight LineNr        ctermfg=DarkRed

" Terminal Color Settings
""Try doing some color
"  "Try using 88 colors
"   if has("terminfo")
"      set t_Co=16
"      set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
"      set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
"    else
"      set t_Co=16
"       set t_Sf=[3%dm
"      set t_Sb=[4%dm
"    endif

set t_Co=16

" open a quick fix window whenever there is something to put in it.
:cwindow
set ruler                       " Show location of cursor in status bar
set statusline=%t%y%r%m%=line\ %l\ of\ %L,\ col\ %c,\ %p%%
set showcmd                     " Show (partial) command in the last line of the screen.
set nolist
set listchars=tab:»·,trail:·
" set listchars=tab:>-,trail:+
set background=dark             " set to 'light' if you use a light background
set scrolloff=2                 " cursors stays 2 lines below/above top/bottom
set noerrorbells
set visualbell                  " flash the screen
set laststatus=2                " always show status line at the bottem of the window.
set title
set linebreak                   " affects how wrapped text is displaed
set foldmethod=manual
let loaded_matchparen = 1       " Don't load the match paren plugin, I don't like it.
set wrap
set number                      " show line numbers (toggled with ,sn)

" make <c-g> more verbose
nnoremap <c-g> 2<c-g>

match todo /@@@/

" show trailing whitespace
" http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

"-----------------------------------------------------------------------------
" interaction
"-----------------------------------------------------------------------------

set confirm                     " Ask user before aborting an action
set history=500                 " Remember this many commands & searches
set autowrite                   " Write often when jumping around
set mouse=a                     " Turn mouse support on
set esckeys                     " Function keys that start with an <Esc> are
                                "  recognized in Insert mode.
set updatetime=400              " This makes Tlist update which function you are
                                "  in much faster.
set backspace=indent,eol,start  " Allows <BS> and ilk to wrap across lines
set whichwrap=<,>,h,l,[,]       " Allow these movement keys to move to next line
set switchbuf=useopen

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

"-----------------------------------------------------------------------------
" search
"-----------------------------------------------------------------------------

set smartcase                   " Make search case-smart, not case-insensitive
set incsearch                   " Show matches while typing searches
set hlsearch

"-----------------------------------------------------------------------------
" formatting
"-----------------------------------------------------------------------------

set autoindent                  " new lines with indentation of previous line
set expandtab                   " insert spaces when <tab> is pressed
set tabstop=4                   " render <tab> visually using this many spaces
set shiftwidth=4                " indentation amount for < and > commands (& cindent)
set softtabstop=4               " this many spaces
set smartindent
set smarttab                    " make <tab> and <BS> deal with indentation properly

set textwidth=80                " where to auto-wrap long lines

set formatoptions=tcrqn         " autoformat options for formatting comments
set formatlistpat="^\s*\(\d\+[\]:.)}\t -]|\*\|-)\s*"

set comments=b:#,:%,:\",://,fb:-,n:>,n:),s1:/*,mb:*,ex:*/
" set comments=b:#,:%,://,fb:-,n:>,n:),s1:/*,mb:*,ex:*/

set cindent
"set    cinkeys=0{,0},:,!,o,O,e
"set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,ps,t0,+s,(0,u0,)20,*30,g0
set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,ps,t0,+s,(s,us,)20,*30,g0

"-----------------------------------------------------------------------------
" saving
"-----------------------------------------------------------------------------

" keep backup & swap files in Vim config dir
set backupdir=~/.vim/tmp/backup
execute "set directory=". &backupdir
silent execute '!mkdir -p '. &backupdir
" set nobackup                    " No backup before overwriting a file

"-----------------------------------------------------------------------------
" insert completion
"-----------------------------------------------------------------------------

set infercase                   " For insert completion
set showfulltag                 " Show full command when doing insert completion
                                "  (so you can see c function args)
set complete=.,w,b,u,t,i

" for ins-completion shortcuts:
inoremap <c-]> <c-x><c-]>
inoremap <c-f> <c-x><c-f>
inoremap <c-d> <c-x><c-d>
inoremap <c-l> <c-x><c-l>
inoremap <c-k> <c-p>
inoremap <c-j> <c-n>
inoremap <silent> <s-tab> <c-x><c-o><c-p>

"-----------------------------------------------------------------------------
" copy and pasting text
"-----------------------------------------------------------------------------

" Y to yank from the cursor to the end of the line.
map Y y$

inoremap <MiddleMouse> <C-O>:set paste<cr><MiddleMouse><C-O>:set nopaste<cr>

" paste in visual mode works:
vmap p d"0P

"-----------------------------------------------------------------------------
" persistant undo support:
"-----------------------------------------------------------------------------

silent execute '!mkdir -p ~/.vim/tmp/undodir'
set undodir=~/.vim/tmp/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

"-----------------------------------------------------------------------------
"   (vim)diff options...
"-----------------------------------------------------------------------------

"set diffopt=iwhite,filler
set diffopt=

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

"-----------------------------------------------------------------------------
"  Menus in console vim
"-----------------------------------------------------------------------------

"  press F3 to bring up menus in console-vim

if ! has("gui_running")
    set wildmenu wildcharm=<C-Z>
    nmap <F3> :runtime menu.vim<cr>:emenu <C-Z>
endif

"      Font menu
amenu F&ont.&5x7            :set guifont=5x7<cr><C-L>
amenu F&ont.&6x10           :set guifont=6x10<cr><C-L>
amenu F&ont.6x13            :set guifont=6x13<cr><C-L>
amenu F&ont.&7x13           :set guifont=7x13<cr><C-L>
amenu F&ont.&8x13           :set guifont=8x13<cr><C-L>
amenu F&ont.&9x15           :set guifont=9x15<cr><C-L>
amenu F&ont.&10x20          :set guifont=10x20<cr><C-L>
amenu F&ont.&12x24          :set guifont=12x24<cr><C-L>
amenu F&ont.&heabfix        :set guifont=-*-haebfix-medium-r-normal-*-15-*-*-*-*-*-*-*<cr><C-L>
amenu F&ont.&lucida         :set guifont=-*-lucidatypewriter-medium-r-*-*-14-*-*-*-*-*-*-*<cr><C-L>

"      Misc menu
amenu Misc.Remove\ &trailing\ white-space<Tab>F10   :%s/\s\+$//<cr>``
amenu Misc.&Save\ Viminfo                           :set viminfo='7,n./viminfo<cr>:wv<cr>:set viminfo=<cr>
amenu Misc.Toggle\ case\ for\ searching<Tab>F4      :set ignorecase!<cr>:set ignorecase?<cr>
amenu Misc.Toggle\ highlight\ search\ results       :set hlsearch!<cr>:set hlsearch?<cr>
amenu Misc.Spell\ Check\ Menu                       :runtime my/spellcheck.vim<cr>
amenu Misc.All\ Chars\ Menu                         :runtime my/char_menu.vim<cr>

"-----------------------------------------------------------------------------
" text replacement (in insert mode)
"-----------------------------------------------------------------------------

iab Ydate <C-R>=strftime("%m/%d/%y")<cr>
  " Example: 8/16/00
iab Ytime <C-R>=strftime("%H:%M")<cr>
  " Example: 14:28
iab Ydt   <C-R>=strftime("%m/%d/%y %T")<cr>
  " Example: 971027 12:00:00
iab Ystamp <C-R>=strftime("%a %b %d %T %Z %Y")<cr>
  " Example: Tue Dec 16 12:07:00 CET 1997

iab teh the
iab tehy they
iab durring during
iab untill until
iab allways always

" catch typos for :wq
cmap Wq wq
cmap WQ wq

" if version < 600
"     set shortmess=astI
" endif

"-----------------------------------------------------------------------------
" My Shortcuts
"-----------------------------------------------------------------------------

let mapleader=","

" toggle wrap:
nmap <C-H> :set wrap!<bar>set wrap?<cr>

nmap <Leader>sc :setlocal spell!<bar>setlocal spell?<cr>

" toggle ('s'witch) stuff:
nmap <Leader>sn :set number!<bar>set number?<cr>
nmap <Leader>sz :set foldenable!<cr>

" toggle paste mode, so you can cmd-v from your desktop paste-buffer and not
" screw up all the formatting:
nmap <Leader>sp :set paste!<bar>set paste?<cr>

nmap <Leader>ss :call CycleTerminalPaletteSize()<cr>
function! CycleTerminalPaletteSize()
    " choose new palette size
    if &t_Co == 8
        set t_Co=16
    elseif &t_Co == 16
        set t_Co=88
    elseif &t_Co == 88
        set t_Co=256
    elseif &t_Co == 256
        set t_Co=8
    endif
    " show new palette size
    redraw
    echo &t_Co
endfunction

" toggle colored right border at textwidth +1
let s:color_column_old='+1'
function! s:ToggleColorColumn()
    echo ':set colorcolumn='s:color_column_old
    if s:color_column_old == ''
        let s:color_column_old = &colorcolumn
        let &colorcolumn=''
    else
        let &colorcolumn=s:color_column_old
        let s:color_column_old=''
    endif
endfunction
:hi ColorColumn ctermbg=darkgrey guibg=darkgrey
nnoremap <Leader>s8 :call <SID>ToggleColorColumn()<cr>

" Toggle vimdiff mode
function! s:ToggleDiff()
    if &diff
        echo ':diffoff'
        :diffoff
    else
        echo ':diffthis'
        :diffthis
    endif
endfunction
nmap <Leader>sd :call <SID>ToggleDiff()<cr>

" decrease keystrokes for these:
nmap <Leader>q :q<cr>
nmap <Leader>Q :qa<cr>
nmap <Leader>w :w<cr>
nmap <Leader>W :wq<cr>
imap jj <esc>
imap jJ <esc>
imap Jj <esc>
imap JJ <esc>

" So, hitting '*' while in visual mode does a search on everything that
" matches the currently selected area. Of course, this does not work
" with multi-line selections.
vnoremap * <esc>:let save_reg=@"<cr>gvy:let @/=@"<cr>:let @"=save_reg<cr>/<cr>
vnoremap # <esc>:let save_reg=@"<cr>gvy:let @/=@"<cr>:let @"=save_reg<cr>?<cr>

" make <c-l> (redraw screen) also turn off search highlighting temporarily
noremap <c-l> :nohlsearch<cr><c-l>

" using the Align() function from plugin/Align_on_char.vim -- within highlighted
" lines, Align() will allign all occurances of some "<string>" to a the same
" column inserting spaces where needed to create the alignment.
vmap <c-l> :Align "="<cr>
vmap <c-k> :Align ":"<cr>

" use tab keys to match bracket pairs
nmap <tab> %
vmap <tab> %

" treat wrapped lines like real lines
nmap <Up> gk
nmap <Down> gj

" These commands deal with changing and minimizing windows up and down.
set winminheight=0
map  <C-J> <C-W>j<C-W>_
map  <C-K> <C-W>k<C-W>_

" move to window left/right and maximize
set winminwidth=2
nmap <Leader>h <C-W>h500<C-W>>
nmap <Leader>l <C-W>l500<C-W>>

" create a new tab
nmap <Leader>T :tabnew<cr>
" move to tab right/left
nmap <Leader>k gt
nmap <Leader>j gT

" previous buffer
map  <F7>  :bp<cr>
" next buffer
map  <F8>  :bn<cr>

"make tag goto open in a different window when clicking on it with the mouse
map <C-LeftMouse> <LeftMouse><C-Space>g
map g<LeftMouse> <LeftMouse><C-Space>g

" strip trailing whitespace
nmap <Leader><space> :%s/\s\+$//<cr>:let @/=''<cr>

" where to search for files when pressing gf
set path=.,
if isdirectory(expand("/usr/include/CC/"))
    set path+=/usr/include/CC
endif
set wildignore=*.o,*.r,*.so,*.tar,*.tgz
set wildmode=list:longest,list:full

"-----------------------------------------------------------------------------
" filetype  (special things for special file types)
"-----------------------------------------------------------------------------

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

"
" Git
"
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

" Define functions
function! PoundComment()
   map - mx:s/^/# /<cr>/<C-p><C-p><cr>'x
   map _ mx:s/^\s*# \?//<cr>/<C-p><C-p><cr>'x
   set comments=:#
endfunction

function! SlashComment()
   map - mx:s/^/\/\/ /<cr>/<C-p><C-p><cr>'x
   map _ mx:s/^\s*\/\/ \?//<cr>/<C-p><C-p><cr>'x
   set comments=://,fb:-,n:>,n:),s1:/*,mb:*,ex:*/
endfunction

function! VimComment()
   map - mx:s/^/" /<cr>/<C-p><C-p><cr>'x
   map _ mx:s/^\s*" \?//<cr>/<C-p><C-p><cr>'x
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
    setlocal spell

    setlocal colorcolumn=+1
    let s:color_column_old=

"     call TlistToggle()

    " go to the 'a'lternate file (i.e. the c file or the header file)
    nmap <Leader>a :A<cr>


    " fold function bodies in c
    nmap <F4> ]]V][zf
endfunction

"-----------------------------------------------------------------------------
" [Plugin]: Conque_Shell
"-----------------------------------------------------------------------------

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

" open a shell with ,sh (open it vertically with ,sv) (assuming <Leader> is ,)
nmap <Leader>sh :call conque_term#open($SHELL, ['belowright split'])<cr>
nmap <Leader>sv :call conque_term#open($SHELL, ['belowright vsplit'])<cr>
" TODO get past version # svn:449 and get the hooks so I can remove 'jj' when in
" the conque shell, and also remove the showing of trailing whitespace

"-----------------------------------------------------------------------------
" [plugin]: taglist
"-----------------------------------------------------------------------------

let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
nmap T :TlistToggle<cr>

"-----------------------------------------------------------------------------
" [plugin]: The_NERD_Commenter
"-----------------------------------------------------------------------------

" toggle comments
nnoremap <silent> <Leader><space> :call NERDComment(0, "toggle")<cr>
vnoremap <silent> <Leader><space> <ESC>:call NERDComment(1, "toggle")<cr>

"-----------------------------------------------------------------------------
" [plugin]: Gundo
"-----------------------------------------------------------------------------

nnoremap <Leader>u :GundoToggle<cr>

"-----------------------------------------------------------------------------
" [plugin]: YankRing
"-----------------------------------------------------------------------------

let g:yankring_replace_n_pkey = '<C-P>'
let g:yankring_replace_n_nkey = '<C-N>'
nmap <Leader>p :YRShow<cr>

" makes `map Y y$` actually work
function! YRRunAfterMaps()
    nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction
