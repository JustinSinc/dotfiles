set nocompatible
set noswapfile
filetype on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'Lokaltog/vim-easymotion'
nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
inoremap <c-s> <Esc>:w!<CR>i
filetype plugin indent on
" Redraw with \r
nnoremap <leader>r <ESC>:redraw!<CR>
" Make tabs work
nnoremap <Tab> <ESC>:tabn<CR>
nnoremap <S-Tab> <ESC>:tabp<CR>
" Strip trailing white space with \t
nnoremap <leader>t <ESC>:%s/\s\+$//<CR>
" Strip blank lines with \d
" nnoremap <leader>d <ESC>:g/^$/d<CR>
" Strip commented lines with \c
nnoremap <leader>c <ESC>:g/^#/d<CR>
" Switch spellcheck with \s
map <leader>s :setlocal spell!<cr>
" Save with F2
map <F2> :w!<CR>
set viminfo^=%
set autoread
let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>
set wrapscan
filetype plugin on
syntax on
set so=7
set ruler
set cmdheight=2
set hid
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set novisualbell
set ffs=unix,dos,mac
set shell=zsh
set number
set whichwrap=b,s,<,>,[,]
set backspace=indent,eol,start
set foldignore=" "
set foldmethod=indent
set formatoptions=cqrt
set ignorecase
set incsearch
set timeoutlen=500
set encoding=utf-8
set nowrap
set mousehide
set noerrorbells
set autoindent
set expandtab 
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4   
autocmd FileType c set 
autocmd FileType css set 
autocmd FileType html set 
autocmd FileType php set 
autocmd FileType python set 
autocmd FileType xml set 
set laststatus=1
set completeopt=menu
