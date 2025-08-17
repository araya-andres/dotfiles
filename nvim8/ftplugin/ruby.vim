setlocal shiftwidth=2
setlocal tabstop=2
nnoremap <buffer> <silent> <F6> :write<CR>:!ruby % &<CR><CR>
inoremap <buffer> <silent> <F6> <Esc>:write<CR>:!ruby % &<CR><CR>
