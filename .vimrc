" Enter the current millenium.
set nocompatible

" Incremental search.
set incsearch

" Automatically load changes.
set autoread

" Don't wrap lines.
set nowrap

" Allow recursive searching.
set path+=**

" Shot what command is being typed.
set showcmd

" Ignore some paths in search.
set wildignore+=*/node_modules/*

" Display all matching files when tab-completing.
set wildmenu

" Init pathogen.
execute pathogen#infect()

" Change | to . in vertical window separator.
set fillchars+=vert:.

" Automatically change directory to current file's directory.
" We don't want this though together with recursive searching.
" set autochdir

" Highlight search.
set hlsearch

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

" Remove whitespaces on save.
autocmd BufWritePre * :%s/\s\+$//e

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
let g:NERDTreeShowLineNumbers = 1

" Hide tildes.
" highlight EndOfBuffer ctermfg=white ctermbg=white

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
nnoremap <Tab>f :tabfind

" Window navigation.
nnoremap <Esc>l <C-w>l
nnoremap <Esc>k <C-w>k
nnoremap <Esc>j <C-w>j
nnoremap <Esc>h <C-w>h

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

noremap <c-u> :call smooth_scroll#up(&scroll, 0, 4)<CR>
noremap <c-d> :call smooth_scroll#down(&scroll, 0, 4)<CR>
noremap <c-b> :call smooth_scroll#up(&scroll*2, 0, 8)<CR>
noremap <c-f> :call smooth_scroll#down(&scroll*2, 0, 8)<CR>

" Toggle highlight search.
nnoremap <F4> :set hlsearch!<CR>

""" Misc

" Number lines in help files.
autocmd FileType help setlocal number relativenumber

" Window resizing.
nnoremap ( :vertical resize -1<CR>
nnoremap ) :resize -1<CR>
nnoremap _ :resize +1<CR>
nnoremap + :vertical resize +1<CR>

" Shortcut for :find.
nnoremap ff :find

" Shortcut for zt.
nnoremap t zt

" For the sake of completeness.
nnoremap <nowait> <C-[> <C-o>

" Compile tags.
command! MakeTags !ctags -R --exclude=.git --exclude=node_modules --exclude=assets .

" Open .vimrc
command! Rc :edit ~/.vimrc

" Setup quick access to manuals.
command! Ref :h reference_toc
command! Usr :h usr_toc
