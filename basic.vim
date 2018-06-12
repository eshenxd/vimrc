"basic vimrc for vim on remote server
let mapleader = "\<Space>"

" chinese support
set fileencodings=utf-8,ucs-bom,gb18039,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" use true color
set t_Co=256

" set max line num
set textwidth=80
set colorcolumn=-2
highlight ColorColumn ctermbg=green guibg=orange

filetype on
filetype plugin on

" fast to line begin & line end
nmap lb 0
nmap le $

set nocompatible
set backspace=indent,eol,start

set wildmenu
set incsearch
set showmatch
set matchtime=1

autocmd BufWritePost $MYVIMRC source $MYVIMRC

vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>Q :qa!<CR>

nnoremap nw <C-W><C-W>

nnoremap <Leader>M %

syntax on
syntax enable

set ruler
set relativenumber

"highlight current line and column
set cursorline
set cursorcolumn

" highlight search result
set hlsearch

set nowrap

set filetype indent on

# set python auto indent to 2 spaces
autocmd FileType python setlocal et sta sw=2 sts=2

