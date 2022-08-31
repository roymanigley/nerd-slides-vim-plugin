set nocompatible
syntax on

let g:NerdSlides_ImageBackgroundColor = "300a24" 

function NerdSlides#next()
    /^\(\(___\+\)\|\(---\+\)\|\(\*\*\*\+\)\s*\)$
    normal j
    let _line = getline('.')
    if match(_line, '^!\[.\+\](.\+)\s*$') == 0
        call NerdSlides#handleImage(_line) 
        call NerdSlides#next()
    endif
    normal zt
endfunction

function NerdSlides#previous()
    ?^\(\(___\+\)\|\(---\+\)\|\(\*\*\*\+\)\s*\)$
    ?^\(\(___\+\)\|\(---\+\)\|\(\*\*\*\+\)\s*\)$
    normal j
    let _line = getline('.')
    if match(_line, '^!\[.\+\](.\+)\s*$') == 0
        call NerdSlides#handleImage(_line) 
        call NerdSlides#previous()
    endif
    normal zt
endfunction

function NerdSlides#handleImage(_line)
    echom a:_line
    let _path = substitute(a:_line, '!\[.\+\](', '', '')
    let _path = substitute(_path, ')', '', '')
    call system("feh -B \"\#" . g:NerdSlides_ImageBackgroundColor . "\" -F \"" . _path . "\"")
endfunction

"nnoremap <C-q> :qa<CR>
"nnoremap <C-down> :call NerdSlides#next()<CR>
"nnoremap <C-up> :call NerdSlides#previous()<CR>
