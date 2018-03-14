" Init pathogen.
execute pathogen#infect()

" Change | to . in vertical window separator.
set fillchars+=vert:.

" Automatically change directory to current file's directory.
set autochdir

" Set hybrid mode.
set relativenumber
set number

" Color at 80 characters.
set colorcolumn=80

" Show existing tab with 4 spaces width.
set tabstop=4
" When indenting with '>', use 4 spaces width.
set shiftwidth=4
" On pressing tab, insert 4 spaces.
set expandtab

" 8 spaces in C.
autocmd filetype c setlocal shiftwidth=8 tabstop=8 expandtab

" Set filetype events.
filetype plugin indent on

" Set highlighting on.
syntax enable

" Color scheme.
set background=light
colorscheme solarized
let g:airline_theme='solarized'

" Change default icons.
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" Hide tildes.
highlight EndOfBuffer ctermfg=white ctermbg=white

" Show tabs with airline.
let g:airline#extensions#tabline#enabled = 1

""" Mappings

" Opposite of <S-j>.
map <F3> i<CR><Esc> 

" Tab navigation.
nnoremap <Tab>l :tabnext<Cr>
nnoremap <Tab>h :tabprevious<Cr>
nnoremap <Tab>1 1gt
nnoremap <Tab>2 2gt
nnoremap <Tab>3 3gt
nnoremap <Tab>4 4gt
nnoremap <Tab>5 5gt
nnoremap <Tab>6 6gt
nnoremap <Tab>7 7gt
nnoremap <Tab>8 8gt
nnoremap <Tab>9 9gt
nnoremap <Tab>e :tabedit 

" Save one click when opening cmd.
nnoremap ; :
nnoremap : ;

" Faster then moving with arrow keys.
noremap! <c-k> <up>
noremap! <c-j> <down>
noremap! <c-h> <left>
noremap! <c-l> <right>

" Open NERDTree with F2.
nnoremap <F2> :NERDTreeToggle<CR>

noremap <c-u> :call smooth_scroll#up(&scroll, 4, 2)<CR>
noremap <c-d> :call smooth_scroll#down(&scroll, 4, 2)<CR>
noremap <c-b> :call smooth_scroll#up(&scroll*2, 8, 4)<CR>
noremap <c-f> :call smooth_scroll#down(&scroll*2, 8, 4)<CR>
