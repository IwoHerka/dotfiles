" Change | to . in vertical window separator.
set fillchars+=vert:.

" Automatically change directory to current file's directory.
set autochdir

" Set hybrid mode.
set relativenumber
set number

" Color at 80 characters.
set colorcolumn=80

" Save one click when opening cmd.
nnoremap ; :
nnoremap : ;

" Faster then moving with arrow keys.
noremap! <c-k> <up>
noremap! <c-j> <down>
noremap! <c-h> <left>
noremap! <c-l> <right>

" Show existing tab with 4 spaces width.
set tabstop=4
" When indenting with '>', use 4 spaces width.
set shiftwidth=4
" On pressing tab, insert 4 spaces.
set expandtab

" 8 spaces in C.
autocmd filetype c setlocal shiftwidth=8 tabstop=8 expandtab

" Init pathogen.
execute pathogen#infect()

" Set filetype events.
filetype plugin indent on

" Set highlighting on.
syntax enable

" Color scheme.
set background=light
colorscheme solarized
let g:airline_theme='solarized'

" Open NERDTree with F2.
nnoremap <F2> :NERDTreeToggle<CR>

" Change default icons.
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" Hide tildes.
highlight EndOfBuffer ctermfg=white ctermbg=white

" Show tabs with airline.
let g:airline#extensions#tabline#enabled = 1
