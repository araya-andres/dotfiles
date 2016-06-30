function! LoadTemplate()
    0r $HOME/.config/nvim/templates/html.tpl
    normal 9G
endfunction

autocmd BufNewFile *.html call LoadTemplate()
