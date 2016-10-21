function! MakeHeader()
    0 put =expand('%:t')
    s/\./_/g
    normal VgUYP
    normal I#ifndef 
    normal j
    normal I#define 
    normal o
    normal o
    normal o
    normal o#endif
    normal jdd2k
endfunction

function! CreateEmptyClass()
    call MakeHeader()
    let b:lexima_disabled = 1
    normal k
    put =expand('%:t:r')
    normal Istruct 
    normal o{
    normal j
    normal o};
    normal k
    let b:lexima_disabled = 0
endfunction

autocmd BufNewFile *.h call MakeHeader()
autocmd BufNewFile *.hpp call CreateEmptyClass()
