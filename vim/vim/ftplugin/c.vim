nnoremap <buffer> <silent> <F6> :!clear; ./%:t:r<CR>
nnoremap <buffer> <silent> <F9> <Esc>:write<CR>:make %:t:r<CR><CR>
autocmd BufWritePost *.c,*.cc,*.cpp,*.h,*.hpp Neomake!
