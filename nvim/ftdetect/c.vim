function! CreateEmptyClass()
    let b:lexima_disabled = 1
    0 put =expand('%:t')
    s/\./_/g
    normal VgUYP
    normal I#ifndef 
    normal jI#define 
    normal o
    put =expand('%:t:r')
    normal Istruct 
    normal o{
    normal o
    normal o};
    normal o
    normal o#endif
    normal jdd3k
    let b:lexima_disabled = 0
endfunction

autocmd BufNewFile *.hpp call CreateEmptyClass()
