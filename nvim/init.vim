set diffopt=vertical
set hidden
set ruler

" line options
set cursorline
highlight CursorLine cterm=None ctermbg=0
set nowrap
set number
set relativenumber
set textwidth=75
match ErrorMsg /\%>75v.\+/
match ErrorMsg /\s\s*$/

set splitbelow
set splitright

set rtp+=/usr/local/opt/fzf

" highlight active window
highlight StatusLineNC cterm=bold ctermfg=white ctermbg=darkgray

" show cursorline only in active window
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" tap options
set expandtab shiftwidth=4 tabstop=4

set smartcase

set nobackup
set noswapfile

" Persistent undo
if has('persistent_undo')
    set undodir=$HOME/.vim_undo_dir
    set undofile
end

function! DeleteTrailingWhitespace()
    normal ma
    let _s=@/
    %s/\s\+$//e
    let @/=_s
    normal `a
endfunction

nnoremap <silent> <BS> :nohlsearch<CR>
nnoremap <silent> <F5> :call DeleteTrailingWhitespace()<CR>
nnoremap <silent> <F12> :exe ':silent !open %'<CR>
nnoremap <silent> <leader>l :set list!<CR>
nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l
tnoremap <M-h> <c-\><c-n><c-w>h
tnoremap <M-j> <c-\><c-n><c-w>j
tnoremap <M-k> <c-\><c-n><c-w>k
tnoremap <M-l> <c-\><c-n><c-w>l

packadd minpac
call minpac#init()

call minpac#add('airblade/vim-gitgutter')             " Shows a git diff in the 'gutter'
call minpac#add('alvan/vim-closetag')                 " Auto close (X)HTML tags
call minpac#add('cohama/lexima.vim')                  " Automatically close pairs
call minpac#add('godlygeek/tabular', {'type': 'opt'}) " Line up text
call minpac#add('junegunn/fzf')                       " Fuzzy finder
call minpac#add('luochen1990/rainbow')
call minpac#add('mechatroner/rainbow_csv')            " Highlight CSV
call minpac#add('mhinz/vim-grepper')                  " Grep wrapper
call minpac#add('tpope/vim-commentary')               " Comment stuff out
call minpac#add('tpope/vim-fugitive')                 " Git wrapper
call minpac#add('tpope/vim-repeat')                   " Remaps . (dot)
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('fatih/vim-go')

" LSP client and autocomplete
call minpac#add('autozimu/LanguageClient-neovim', {'do': './install.sh'})
call minpac#add('HerringtonDarkholme/yats.vim')       " Typescript
call minpac#add('pangloss/vim-javascript')

command PackUpdate call minpac#update()
command PackClean call minpac#clean()

" neovim
set clipboard+=unnamedplus

" rainbow
let g:rainbow_active=1

" Use the same symbols as TextMate for tabstops and EOLs<Paste>
set listchars=tab:▸\ ,eol:¬

" Improve the display of wrapped lines
set showbreak=↪

" Search for the current word
nnoremap <Leader>* :GrepperGit <C-R><C-W><CR>

let &path.="include"

augroup python
    autocmd!
    autocmd FileType python setlocal noet ts=4
augroup end

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'python': ['pyls'],
    \ 'cpp': ['clangd'],
    \ 'c': ['clangd'],
    \ 'go': ['gopls'],
    \ }

let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:python3_host_prog = '/Users/andresarayarojas/.pyenv/versions/3.9.7/bin/python'
