"-----------------------------------------------------------------------------
" PLUGIN: vim-addon-manager (vam)
"-----------------------------------------------------------------------------
"
" INSTALLING PLUGINS:
"
"   Every time vim is started, it will look in the 'vam#ActivateAddons' list
"   below and install any plugins you don't already have installed the next time
"   you launch vim.  Plugins get installed into ~/.vim/vim-addons/.  There are
"   thousands of available plugins.
"
"   Finding new plugins (<c-d> to autocomplete addon names):
"
"       :ActiveAddons <c-d>
"
"   Find the name you want and add it to the vam#ActivateAddons below to use it
"   permanently.
"
" NOTE:
"
"   Re: pathogen
"
"   I'm using vim-addon-manager instead of pathogen for modules I haven't
"   modified and don't want to check into my repository. vim-addon-manager is
"   more feature full, requires less effort when adding new plugins, makes it
"   easier to update my external plugins and doesn't require me to add all the
"   plugins I want to my .vim/ git repository.
"
"   I am however using pathogen for my own modules.  These are things that are
"   custom to me and haven't been released to the wider vim script world (i.e.
"   aren't available under vam).  These are under ~/.vim/bundle/.
"
"   For those interested in pathogen see:
"   http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen
"
fun SetupVAM()
    let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
    exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

    if !filereadable(vam_install_path.'/vim-addon-manager/.git/config') && 1 == confirm("git clone VAM into ".vam_install_path."?","&Y\n&N")
        exec '!p='.shellescape(vam_install_path).'; mkdir -p "$p" && cd "$p" && git clone --depth 1 git://github.com/MarcWeber/vim-addon-manager.git'
        " VAM run helptags automatically if you install or update plugins
        exec 'helptags '.fnameescape(vam_install_path.'/vim-addon-manager/doc')
    endif

    " git shoud be in your path.
    call vam#ActivateAddons([
\           'pathogen',
\           'snipmate',
\           'snipmate-snippets',
\           'Indent_Guides',
\           'Conque_Shell',
\           'Tagbar',
\           'vcscommand',
\           'clang_complete',
\           'cscope_macros',
\           'git.zip',
\           'fugitive',
\           'a',
\           'surround',
\           'CCTree',
\           'YankRing',
\           'Align%294',
\           'Command-T',
\           'The_NERD_Commenter',
\           'LargeFile',
\           'matchit.zip',
\           ],
\       {'auto_install' : 1})
" \           'powerline',
" \           'Gundo',


    " Load the modules in ~/.vim/bundle/
    call pathogen#infect()
endfun
call SetupVAM()


"-----------------------------------------------------------------------------
" appearance
"-----------------------------------------------------------------------------

syntax on

highlight Comment       ctermfg=DarkCyan
highlight LineNr        ctermfg=DarkRed

" Terminal Color Settings
set t_Co=16
" Try doing some color
"if has("terminfo")
"    set t_Co=16
"    set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
"    set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
"else
"    set t_Co=16
"    set t_Sf=[3%dm
"    set t_Sb=[4%dm
"endif

:cwindow                        " Open quick fix window when there's needed
set ruler                       " Show location of cursor in status bar
set statusline=%t%y%r%m%=line\ %l\ of\ %L,\ col\ %c,\ %p%%
set showcmd                     " Show multi-char cmds as you type; bottom right
set list                        " Toggle this with cmd defined below
" set listchars=tab:»·
set listchars=tab:>-
" set listchars=tab:»·,trail:·
" set listchars=tab:>-,trail:+

set background=dark             " Set to 'light' if you use a light background
set scrolloff=2                 " Cursors stays 2 lines below/above top/bottom
set noerrorbells
set visualbell                  " Flash the screen
set laststatus=2                " Show status line at the bottom of the window.
set title
set linebreak                   " Affects how wrapped text is displayed
set foldmethod=manual
let loaded_matchparen = 1       " Don't load the match paren plugin, I don't like it.
set wrap
set number                      " Show line numbers (toggled with ,sn)
set nocursorline                " don't highlight the current line

" Make <c-g> more verbose
nnoremap <c-g> 2<c-g>

match todo /@@@/

" Show trailing whitespace
" http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
" see below for shortcut to toggle this.
highlight EOLWS ctermbg=red guibg=red

"-----------------------------------------------------------------------------
" interaction
"-----------------------------------------------------------------------------

set confirm                     " Ask user before aborting an action
set history=500                 " Remember this many commands & searches
set autowrite                   " Write often when jumping around
set mouse=a                     " Turn mouse support on
set ttymouse=xterm2             " Enable window-split drag-to-resize. (esp. in
                                "  screen which defaults to 'xterm')
set ttyfast                     " performance boost for vim's display
set esckeys                     " Function keys that start with an <Esc> are
                                "  recognized in Insert mode.
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
set tabstop=8                   " render <tab> visually using this many spaces
set shiftwidth=4                " indentation amount for < and > commands (& cindent)
set softtabstop=4               " this many spaces
set smartindent
set smarttab                    " make <tab> and <BS> deal with indentation properly

set textwidth=80                " where to auto-wrap long lines

set formatoptions=crqt          " auto-format options for formatting comments
set formatlistpat="^\s*\(\d\+[\]:.)}\t -]|\*\|-)\s*"

set comments=b:#,:%,:\",://,fb:-,n:>,n:),s1:/*,mb:*,ex:*/
"set comments=b:#,:%,://,fb:-,n:>,n:),s1:/*,mb:*,ex:*/

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

" paste while in insert mode (cmd-v on mac).  This isn't so easy to make hapen
" in nmap mode (someday).
inoremap <d-v> <c-o>:set paste<cr><c-r>*<c-o>:set nopaste<cr>

" paste in visual mode works:
vmap p d"0P

inoremap <MiddleMouse> <c-o>:set paste<cr><MiddleMouse><c-o>:set nopaste<cr>

"-----------------------------------------------------------------------------
" Persistent undo support:
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

"      Misc menu
amenu Misc.Toggle\ case\ for\ searching<Tab>F4      :set ignorecase!<cr>:set ignorecase?<cr>
amenu Misc.Remove\ &trailing\ white-space<Tab>F10   :%s/\s\+$//<cr>``
amenu Misc.Toggle\ highlight\ search\ results       :set hlsearch!<cr>:set hlsearch?<cr>
amenu Misc.&Save\ Viminfo                           :set viminfo='7,n./viminfo<cr>:wv<cr>:set viminfo=<cr>
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

"-----------------------------------------------------------------------------
" My Shortcuts
"-----------------------------------------------------------------------------

let mapleader=","

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

" For when you want to make sure you're not over 80 columns of text.
" toggle colored right border at textwidth +1
nnoremap <Leader>s8 :call <SID>ToggleColorColumn()<cr>
autocmd BufRead * let b:color_column_old='+1'
function! s:ToggleColorColumn()
    echo ':set colorcolumn='b:color_column_old
    if b:color_column_old == ''
        let b:color_column_old = &colorcolumn
        let &colorcolumn=''
    else
        let &colorcolumn=b:color_column_old
        let b:color_column_old=''
    endif
endfunction
" highlight ColorColumn ctermbg=darkgrey guibg=darkgrey
highlight ColorColumn ctermbg=52 guibg=DarkRed

" Toggle vimdiff mode
nmap <Leader>sd :call <SID>ToggleDiff()<cr>
function! s:ToggleDiff()
    if &diff
        echo ':diffoff'
        :diffoff
    else
        echo ':diffthis'
        :diffthis
    endif
endfunction
nmap <Leader>du :diffupdate<cr><c-l>

nmap <Leader>sw :call <SID>ToggleHiTrailingWS()<cr>
let s:highlightTrailingWhiteSpace=1
function! s:ToggleHiTrailingWS()
    if s:highlightTrailingWhiteSpace == 1
        let s:highlightTrailingWhiteSpace = 0
        highlight clear EOLWS
        echo ':highlight clear EOLWS'
    else
        let s:highlightTrailingWhiteSpace = 1
        highlight EOLWS ctermbg=red guibg=red
        echo ':highlight EOLWS ctermbg=red guibg=red'
    endif
endfunction

" strip trailing whitespace
nmap <Leader>sW :%s/\s\+$//<cr>:let @/=''<cr>

" spell check
nmap <Leader>sc :setlocal spell!<bar>setlocal spell?<cr>

" toggle ('s'witch) stuff:
nmap <Leader>sn :set number!<bar>set number?<cr>
nmap <Leader>n :set number!<bar>set number?<cr>

nmap <Leader>sz :set foldenable!<cr>

" toggle paste mode, (though this shouldn't be needed (on macs) because of the
" 'inoremap <d-v>' above).
nmap <Leader>sp :set paste!<bar>set paste?<cr>

" toggle wrap:
nmap <C-H> :set wrap!<bar>set wrap?<cr>

nmap <Leader>sl :set list!<bar>set list?<cr>

" decrease keystrokes for these:
nmap <Leader>q :q<cr>
nmap <Leader>Q :qa<cr>
nmap <Leader>w :w<cr>
nmap <Leader>W :wa<cr>
inoremap jj <esc>
inoremap jJ <esc>
inoremap Jj <esc>
inoremap JJ <esc>

" So, hitting '*' while in visual mode does a search on everything that
" matches the currently selected area. Of course, this does not work
" with multi-line selections.
vnoremap * <esc>:let save_reg=@"<cr>gvy:let @/=@"<cr>:let @"=save_reg<cr>/<cr>
vnoremap # <esc>:let save_reg=@"<cr>gvy:let @/=@"<cr>:let @"=save_reg<cr>?<cr>

" make <c-l> (redraw screen) also turn off search highlighting temporarily
noremap <c-l> :nohlsearch<cr><c-l>

" Using the Align() function from plugin/Align_on_char.vim -- within highlighted
" lines, Align() will align all occurrences of some "<string>" to the same
" column inserting spaces where needed to create the alignment.
vmap <c-l> :Align "="<cr>
vmap <c-k> :Align ":"<cr>

" use tab keys to match bracket pairs
" my snipMate breaks this.
" so i'm using prepending the `autocmd VimEnter * :`
autocmd VimEnter * :nnoremap <tab> %
autocmd VimEnter * :xnoremap <tab> %

" vim has a bug where it cannot distinguish ctrl-i from <tab>.  I want to use
" ctrl-i and ctrl-o but also I want <tab> to match circumfixes.  I can't do
" both, so I'm remapping ctrl-t to function as ctrl-i.
nnoremap <c-t> <c-i>
xnoremap <c-t> <c-i>

" treat wrapped lines like real lines
nmap <Up> gk
nmap <Down> gj
nmap k gk
nmap j gj

" These commands deal with changing and minimizing windows up and down.
set winminheight=0
noremap <c-k> <c-w>k<c-w>_
noremap <c-j> <c-w>j<c-w>_

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
autocmd BufNewFile,BufRead *.git/COMMIT_EDITMSG    setlocal spell
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
autocmd BufRead,BufNewFile *.rfs set ft=rfs
autocmd BufRead,BufNewFile *.log set ft=rfs
autocmd BufRead,BufNewFile *.out set ft=rfs
autocmd BufRead,BufNewFile GNUmakerules set ft=make


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
    setlocal spell
endfunction

function! SlashComment()
    map - mx:s/^/\/\/ /<cr>/<C-p><C-p><cr>'x
    map _ mx:s/^\s*\/\/ \?//<cr>/<C-p><C-p><cr>'x
    set comments=://,fb:-,n:>,n:),s1:/*,mb:*,ex:*/
    setlocal spell
endfunction

function! VimComment()
    map - mx:s/^/" /<cr>/<C-p><C-p><cr>'x
    map _ mx:s/^\s*" \?//<cr>/<C-p><C-p><cr>'x
    set comments=:\"
    setlocal spell
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

"     setlocal colorcolumn=+1
"     let s:color_column_old=''

    " go to the 'a'lternate file (i.e. the c file or the header file)
    nmap <Leader>a :A<cr>


    " fold function bodies in c
    nmap <F4> ]]V][zf
endfunction

"-----------------------------------------------------------------------------
" PLUGIN: netrw (dir browser):
"-----------------------------------------------------------------------------

let g:netrw_liststyle = 3            " Set tree style listing by default
let g:netrw_sort_sequence = '[\/]$,\<core\%(\.\d\+\)\=,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$' " don't separate .c from .h
let g:netrw_preview   = 1            " preview window 'p' defaults to vertical
let g:netrw_winsize   = 30           " on preview keep width marginalized to 30

"-----------------------------------------------------------------------------
" PLUGIN: Conque_Shell
"-----------------------------------------------------------------------------

" horizontal shell window:
nmap <Leader>sh :call conque_term#open($SHELL, ['belowright split'])<cr>
" vertical shell window:
nmap <Leader>sv :call conque_term#open($SHELL, ['belowright vsplit'])<cr>

" The default here is <F9> but I don't need this option and already use <F9> for
" something else:
let g:ConqueTerm_SendVisKey = ''
let g:ConqueTerm_ToggleKey = '<F6>' " Toggle terminal input mode - to edit it as
                                    " if it were a normal text buffer
" let g:ConqueTerm_TERM = 'xterm'
let g:ConqueTerm_CWInsert = 1       " allow <c-w> to work in insert mode
let g:ConqueTerm_InsertOnEnter = 1

let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_CloseOnEnd = 1

function! MyConqueKeyMappings(term)
    inoremap <silent> <buffer> <C-w>J <Esc><C-w>J
    inoremap <silent> <buffer> <C-w>K <Esc><C-w>K
    inoremap <silent> <buffer> <C-w>H <Esc><C-w>H
    inoremap <silent> <buffer> <C-w>L <Esc><C-w>L

    inoremap <silent> <buffer> <C-w><C-j> <Esc><C-w>j
    inoremap <silent> <buffer> <C-w><C-k> <Esc><C-w>k
    inoremap <silent> <buffer> <C-w><C-h> <Esc><C-w>h
    inoremap <silent> <buffer> <C-w><C-l> <Esc><C-w>l

    inoremap <silent> <buffer> <C-w>n <Esc><C-w>n
    inoremap <silent> <buffer> <C-w>v <Esc><C-w>v
    inoremap <silent> <buffer> <C-w><C-n> <Esc><C-w>n
    inoremap <silent> <buffer> <C-w><C-v> <Esc><C-w>v

    inoremap <silent> <buffer> <C-w>x <Esc><C-w>x
    inoremap <silent> <buffer> <C-w><C-x> <Esc><C-w>x

    inoremap <silent> <buffer> <C-w>c <Esc><C-w>c
    inoremap <silent> <buffer> <C-w><C-c> <Esc><C-w>c

    inoremap <silent> <buffer> <C-w>w <Esc><C-w>w
    inoremap <silent> <buffer> <C-w><C-w> <Esc><C-w>w

    inoremap <silent> <buffer> <C-w>_ <Esc><C-w>_
    " these are broke for now Conque needs to be fixed for them to work:
    inoremap <silent> <buffer> <C-j> <Esc><C-w>j<C-w>_
    inoremap <silent> <buffer> <C-k> <Esc><C-w>k<C-w>_
    iunmap jj
    iunmap jJ
    call s:ToggleHiTrailingWS()
endfunction
call conque_term#register_function('after_keymap', 'MyConqueKeyMappings')

function! MyConqueBufferEnter(term)
    " Since I use my zsh in vi mode and have mapped jj as <esc> for shell cmd
    " line editing, I don't want to have vim keep jj from going through to my
    " shell, that means I need to use <esc> to get out of edit mode in Conque
    iunmap jj
    iunmap jJ
endfunction
call conque_term#register_function('buffer_enter', 'MyConqueBufferEnter')

function! MyConqueBufferLeave(term)
    imap jj <Esc>
    imap jJ <Esc>
endfunction
call conque_term#register_function('buffer_leave', 'MyConqueBufferLeave')

"-----------------------------------------------------------------------------
" PLUGIN: Tagbar
"-----------------------------------------------------------------------------

nmap T :TagbarToggle<cr>
let g:tagbar_width = 30
let g:tagbar_left = 1
let g:tagbar_sort = 0
let g:tagbar_iconchars = ['+', '-']

" "-----------------------------------------------------------------------------
" " PLUGIN: The_NERD_Commenter
" "-----------------------------------------------------------------------------
"
" " toggle comments
" nnoremap <silent> <Leader><space> :call NERDComment(0, "toggle")<cr>
" vnoremap <silent> <Leader><space> <ESC>:call NERDComment(1, "toggle")<cr>

"-----------------------------------------------------------------------------
" PLUGIN: Gundo
"-----------------------------------------------------------------------------

nnoremap <Leader>u :GundoToggle<cr>

"-----------------------------------------------------------------------------
" PLUGIN: YankRing
"-----------------------------------------------------------------------------

let g:yankring_history_dir = '~/.vim/tmp'
let g:yankring_replace_n_pkey = '<c-p>'
let g:yankring_replace_n_nkey = '<c-n>'
nmap <Leader>p :YRShow<cr>

" makes `map Y y$` actually work
function! YRRunAfterMaps()
    nnoremap Y   :<C-u>YRYankCount 'y$'<cr>
endfunction

"-----------------------------------------------------------------------------
" PLUGIN: Indent_Guides
"-----------------------------------------------------------------------------

nmap <Leader>si :IndentGuidesToggle<cr>

"-----------------------------------------------------------------------------
" PLUGIN: CCTree_-_C_Call-Tree_Explorer
"-----------------------------------------------------------------------------

" make sure you have CCTree version >= 1.33
let g:CCTreeKeyTraceForwardTree = '<Leader>t.'
let g:CCTreeKeyTraceReverseTree = '<Leader>t,'
let g:CCTreeKeyDepthPlus = '<Leader>t='
let g:CCTreeKeyDepthMinus = '<Leader>t-'
function! CCTreeQuickDBLoad()
    if filereadable('CCTree.XRefDB')
        CCTreeLoadXRefDBFromDisk CCTree.XRefDB
    else
        if !filereadable('cscope.out')
            " `csc` is my local ~/bin/csc script for generating my cscope.out db:
            !csc
        endif
        CCTreeLoadDB cscope.out
        CCTreeSaveXRefDB CCTree.XRefDB
    endif
endfunction
nmap <Leader>tl :call CCTreeQuickDBLoad()<cr>

" autocmd VimEnter * if filereadable('cscope.out') | call CCTreeQuickDBLoad() | endif

"-----------------------------------------------------------------------------
" PLUGIN: powerline
"-----------------------------------------------------------------------------

let g:Powerline_cache_file = '~/.vim/tmp/Powerline.cache'
" let g:Powerline_symbols = 'unicode'
