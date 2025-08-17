function! MakeHeader()
    0 put =expand('%:t')
    silent s/\./_/
    silent s/[A-Z]/_&/g
    normal xVgUYP
    normal I#ifndef 
    normal j
    normal I#define 
    normal o
    normal o
    normal o#endif
    normal jddk
endfunction

function! CreateEmptyClass()
    call MakeHeader()
    let b:lexima_disabled = 1
    normal k
    put =expand('%:t:r')
    normal YIclass 
    normal o{
    normal opublic:
    normal <<
    normal 2p
    normal A();
    normal >j
    normal j
    normal Ivirtual ~
    normal A() = default;
    normal o
    normal oprivate:
    normal <<
    normal o};
    normal k0
    let b:lexima_disabled = 0
endfunction

autocmd BufNewFile *.h,*.hpp call CreateEmptyClass()
