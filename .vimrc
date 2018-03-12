set fillchars+=vert:.
let g:netrw_liststyle = 3
filetype indent on
set autochdir
set relativenumber
set number
set colorcolumn=80
nnoremap ; :
nnoremap : ;
noremap! <c-k> <up>
noremap! <c-j> <down>
noremap! <c-h> <left>
noremap! <c-l> <right>
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
autocmd filetype c setlocal shiftwidth=8 tabstop=8 expandtab
execute pathogen#infect()
syntax on
filetype plugin indent on
