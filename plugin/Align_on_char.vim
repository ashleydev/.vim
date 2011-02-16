com! -range Align <line1>,<line2>call AlignOnRE(<q-args>)
fun! AlignOnRE(re) range
    let last = 0
    let i = a:firstline
    while i <= a:lastline
        exec "let col" . i . "= match(getline(i)," . a:re . ")"
        exec 'if col' . i . '> last | let last = col' . i . '| endif'
        let i = i + 1
    endwhile
    let i = a:firstline
    while i <= a:lastline
        exec ' let col = col' . i
        if col > 0
            exec 'let N = last - col' . i
            let s = ""
            let j = 1
            while j <= N
                let s = s . " "
                let j = j + 1
            endwhile
            let dots = strpart(getline(i), 0, col)
            let dots = substitute(dots, '.', '.', 'g')
            let str = substitute(getline(i), '^' . dots, '&' . s, '')
            call setline(i, str)
        endif
        let i = i + 1
    endwhile
endfun

