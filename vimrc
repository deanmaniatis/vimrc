"""""""""""""""""""""""""""""""""
" Plugins                       "
"""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'fatih/molokai'
call plug#end()


""""""""""""""""""""""""""""""""
" Vim settings                 "
""""""""""""""""""""""""""""""""
" cannot live without
set nocompatible		" not applicable to neovim
filetype off
filetype plugin indent on
set number
set relativenumber
set wildmenu
set path+=**
set autowrite 
set autoread

" less important
set noswapfile
set background=dark
set showcmd


""""""""""""""""""""""""""""""""
" Window managent              "
""""""""""""""""""""""""""""""""
set splitright
set splitbelow


""""""""""""""""""""""""""""""""
" Styling                      "
""""""""""""""""""""""""""""""""
syntax enable
colorscheme molokai
set termguicolors		" to support molokai theme


""""""""""""""""""""""""""""""""
" Key-mapping                  "
""""""""""""""""""""""""""""""""
let mapleader=','

nnoremap ; :
inoremap jk <ESC>
