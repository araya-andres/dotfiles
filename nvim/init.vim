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

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" quickfix
let g:quickfix_is_open = 0

function! CloseQuickfix()
    cclose
    let g:quickfix_is_open = 0
endfunction

function! OpenQuickfix()
    botright cwindow
    setlocal wrap
    let g:quickfix_is_open = 1
endfunction

function! QuickfixToggle()
    if g:quickfix_is_open
        call CloseQuickfix()
    else
        call OpenQuickfix()
    endif
endfunction

function! DeleteTrailingWhitespace()
    normal ma
    let _s=@/
    %s/\s\+$//
    let @/=_s
    normal `a
endfunction

" cscope
if has('cscope')
    set cscopetag
    if filereadable("cscope.out")
        cscope add cscope.out
    elseif $CSCOPE_DB != ""
        cscope add $CSCOPE_DB
    endif
    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
        nnoremap <silent> <leader>c :cscope find c <C-r><C-w><CR><C-o>:call OpenQuickfix()<CR>
        nnoremap <silent> <leader>f :cscope find s <C-r><C-w><CR><C-o>:call OpenQuickfix()<CR>
    endif
endif

" mappings
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <silent> <BS> :nohlsearch<CR>
nnoremap <silent> <C-b> :CtrlPBuffer<CR>
nnoremap <silent> <F5> :call DeleteTrailingWhitespace()<CR>
nnoremap <silent> <leader>g :grep <C-R><C-W> "%"<CR><CR><CR>:call OpenQuickfix()<CR>
nnoremap <silent> <leader>l :set list!<CR>
nnoremap <silent> <leader>q :call QuickfixToggle()<CR>
nnoremap <silent> <leader>t :TagbarToggle<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"============================================================================
" Make :help appear in a full-screen tab, instead of a window
"============================================================================

"Only apply to .txt files...
augroup HelpInTabs
    autocmd!
    autocmd BufEnter *.txt call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
    if &buftype == 'help'
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction

" neovim
set clipboard+=unnamedplus

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'araya-andres/papercolor-theme'
Plug 'benekastah/neomake'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'   , { 'on': 'Tabularize' }
Plug 'https://github.com/cohama/lexima.vim'
Plug 'https://github.com/derekwyatt/vim-scala'
Plug 'kien/ctrlp.vim'
Plug 'kshenoy/vim-signature'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'   , { 'on': 'TagbarToggle' }
Plug 'metakirby5/codi.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/SearchComplete'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/camelcasemotion'
call plug#end()

colorscheme PaperColor
set background=dark

" rainbow
let g:rainbow_active      = 1

" Use the same symbols as TextMate for tabstops and EOLs<Paste>
set listchars=tab:▸\ ,eol:¬

" Improve the display of wrapped lines
set showbreak=↪

let g:codi#interpreters = {
                   \ 'R': {
                       \ 'bin': 'R',
                       \ 'prompt': '^> ',
                       \ },
                   \ }
