set diffopt=vertical
set hidden
set ruler

" line options
set cursorline
set nowrap
set number
set relativenumber
set textwidth=75
match ErrorMsg /\%>75v.\+/
match ErrorMsg /\s\s*$/

set splitbelow
set splitright

" tap options
set expandtab shiftwidth=4 tabstop=4

set smartcase

" Persistent undo
if has('persistent_undo')
    set undodir=$HOME/.vim_undo_dir
    set undofile
end

function! DeleteTrailingWhitespace()
    normal ma
    let _s=@/
    %s/\s\+$//
    let @/=_s
    normal `a
endfunction

nnoremap <silent> <BS> :nohlsearch<CR>
nnoremap <silent> <F5> :call DeleteTrailingWhitespace()<CR>
nnoremap <silent> <leader>l :set list!<CR>

packadd minpac
call minpac#init()

call minpac#add('airblade/vim-gitgutter')
call minpac#add('araya-andres/papercolor-theme')
call minpac#add('benekastah/neomake')
call minpac#add('ervandew/supertab')
call minpac#add('godlygeek/tabular', {'type': 'opt'})
call minpac#add('https://github.com/cohama/lexima.vim')
call minpac#add('junegunn/fzf')
call minpac#add('luochen1990/rainbow')
call minpac#add('majutsushi/tagbar', {'type': 'opt'})
call minpac#add('mechatroner/rainbow_csv')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')

command PackUpdate call minpac#update()
command PackClean call minpac#clean()

colorscheme PaperColor
set background=dark

" neovim
set clipboard+=unnamedplus

" rainbow
let g:rainbow_active = 1

" Use the same symbols as TextMate for tabstops and EOLs<Paste>
set listchars=tab:▸\ ,eol:¬

" Improve the display of wrapped lines
set showbreak=↪
