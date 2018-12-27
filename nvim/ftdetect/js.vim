set expandtab shiftwidth=2 tabstop=2
let g:jsx_ext_required = 0

function! NpmStart()
  split
  resize 10
  set wfh
  set norelativenumber
  set nonumber
  terminal npm start
  wincmd p
endfunction

nnoremap <buffer> <silent> <F6> :call NpmStart()<CR>
