set makeprg=jshint\ %
set errorformat=%f:\ line\ %l\,\ col\ %c\,\ %m

function! MakeFunctionalComponent()
  normal iimport React from 'react'
  normal o
  put =expand('%:t')
  normal ~
  s/\.js//
  normal Y2P
  normal Iconst 
  normal A = props =>
  normal j
  s/\([A-Z]\)/ \1/g
  normal I<div>
  normal A</div>
  normal o
  normal jIexport default 
  normal kkguit
endfunction

nnoremap <silent> <leader>f :call MakeFunctionalComponent()<CR>
