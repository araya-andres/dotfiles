nnoremap <buffer> <silent> <F6> :!clear; ./%:t:r<CR>
autocmd BufWritePost *.c,*.cc,*.cpp,*.h,*.hpp Neomake!
