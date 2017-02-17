nnoremap <buffer> <silent> <F6> :!./%:t:r<CR>
autocmd BufWritePost *.c,*.cc,*.cpp,*.h,*.hpp Neomake!
