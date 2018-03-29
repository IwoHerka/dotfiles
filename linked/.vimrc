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
set wildignore+=*/__pycache__/*

" Display all matching files when tab-completing.
set wildmenu

" Disable annoying comment autoinsert.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Init pathogen.
execute pathogen#infect()

" Change | to . in vertical window separator.
set fillchars+=vert:.

" Automatically change directory to current file's directory.
" We don't want this though together with recursive searching.
" set autochdir

" Highlight search.
" set hlsearch

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
let g:NERDTreeMinimalUI = 1
let NERDTreeIgnore=['\~$', '\.pyc$', '__pycache__']

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
nnoremap <S-l> <C-w>l
nnoremap <S-k> <C-w>k
nnoremap <S-j> <C-w>j
nnoremap <S-h> <C-w>h

" Save one click when opening cmd.
nnoremap ; :
nnoremap : ;

nnoremap cc "*
nnoremap cv "*p
nnoremap cV "*P

" Faster then moving with arrow keys.
noremap! <c-k> <up>
noremap! <c-j> <down>
noremap! <c-h> <left>
noremap! <c-l> <right>

" Open NERDTree with F2.
nnoremap <F2> :NERDTreeToggle<CR>

" Toggle highlight search.
nnoremap <F4> :set hlsearch!<CR>

" Open CtrlP
nnoremap <C-p> :CtrlP<Cr>

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

" Easier to navigate in NERDTree.
nmap <Space> <CR>

" For the sake of completeness.
" nnoremap <nowait> <C-[> <C-o>

" Compile tags.
command! MakeTags !ctags -R --exclude=.git --exclude=node_modules --exclude=assets .

" Open .vimrc
command! Rc :edit ~/.vimrc

" Setup quick access to manuals.
command! Ref :h reference_toc
command! Usr :h usr_toc

""" Scripts


" BufOnly.vim  -  Delete all the buffers except the current/named buffer.
"
" Copyright November 2003 by Christian J. Robinson <infynity@onewest.net>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Bonly / :BOnly / :Bufonly / :BufOnly [buffer]
"
" Without any arguments the current buffer is kept.  With an argument the
" buffer name/number supplied is kept.

command! -nargs=? -complete=buffer -bang Bonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly
    \ :call BufOnly('<args>', '<bang>')

function! BufOnly(buffer, bang)
	if a:buffer == ''
		" No buffer provided, use the current buffer.
		let buffer = bufnr('%')
	elseif (a:buffer + 0) > 0
		" A buffer number was provided.
		let buffer = bufnr(a:buffer + 0)
	else
		" A buffer name was provided.
		let buffer = bufnr(a:buffer)
	endif

	if buffer == -1
		echohl ErrorMsg
		echomsg "No matching buffer for" a:buffer
		echohl None
		return
	endif

	let last_buffer = bufnr('$')

	let delete_count = 0
	let n = 1
	while n <= last_buffer
		if n != buffer && buflisted(n)
			if a:bang == '' && getbufvar(n, '&modified')
				echohl ErrorMsg
				echomsg 'No write since last change for buffer'
							\ n '(add ! to override)'
				echohl None
			else
				silent exe 'bdel' . a:bang . ' ' . n
				if ! buflisted(n)
					let delete_count = delete_count+1
				endif
			endif
		endif
		let n = n+1
	endwhile

	if delete_count == 1
		echomsg delete_count "buffer deleted"
	elseif delete_count > 1
		echomsg delete_count "buffers deleted"
	endif

endfunction
