set makeprg=jshint\ %
set errorformat=%f:\ line\ %l\,\ col\ %c\,\ %m
autocmd BufWritePost *.js Neomake
