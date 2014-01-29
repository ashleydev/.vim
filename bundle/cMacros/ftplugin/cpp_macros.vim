" This is a function which will allign any '\''s at the end of lines with in
" the given range at the &textwidth.  This functions intended use was to
" allign back-slashes in a macro (in C).
vmap <C-\>  :FixMacro<CR>
command! -range FixMacro <line1>,<line2>call AlignFinalBSlash()
function! AlignFinalBSlash() range
    let i = a:firstline
    while i <= a:lastline

        "Remove trailing white-space
        exec i . 's/\s\+$//e'
        "Remove trailing '\'
        exec i . 's/\\$//e'
        "Remove trailing white-space
        exec i . 's/\s\+$//e'

        let line_len = strlen(getline(i))
        if line_len < &textwidth
            let N = &textwidth - line_len
            let s = ""
            let j = 1
            while j < N
                let s = s . " "
                let j = j + 1
            endwhile
            call setline(i, getline(i) . s . '\')
        else
            call setline(i, getline(i) . ' \')
        endif

        let i = i + 1
    endwhile
endfunction

" This is a function which will remove any '\''s at the end of lines with in
" the given range.
vmap <BS>  :RemoveMacroSlashes<CR>
command! -range RemoveMacroSlashes <line1>,<line2>call RemoveFinalBSlash()
function! RemoveFinalBSlash() range
    let i = a:firstline
    while i <= a:lastline
        "Remove trailing white-space
        exec i . 's/\s\+$//e'
        "Remove trailing '\'
        exec i . 's/\\$//e'
        "Remove trailing white-space
        exec i . 's/\s\+$//e'
        let i = i + 1
    endwhile
endfunction
