"""""""""""""""""""""""""""""""""
" Plugins                       "
"""""""""""""""""""""""""""""""""
if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  call plug#begin('~/.vim/plugged')
endif

Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'easymotion/vim-easymotion'
Plug 'sebdah/vim-delve'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'dag/vim-fish'
Plug 'fatih/vim-hclfmt'
Plug 'b4b4r07/vim-hcl'
" Plug 'christoomey/vim-tmux-navigator'
"

Plug 'deanmaniatis/vim-colors-mania'
Plug 'fatih/molokai'
Plug 'pbrisbin/vim-colors-off'
call plug#end()


""""""""""""""""""""""""""""""""
" Plugin settings              "
""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#unimported_packages = 1

""""""""""""""""""""""""""""""""
" Vim settings                 "
""""""""""""""""""""""""""""""""
" cannot live without
filetype off
filetype plugin indent on
set wildmenu
set path+=**
set autowriteall				" go-build/run autosaves file"
set autoread
set hidden
set clipboard=unnamedplus

" " less important
set tabstop=8 
set softtabstop=0 
set expandtab 
set shiftwidth=4 
set smarttab

set noswapfile
set background=dark
set showcmd

set cursorline
set ignorecase
set smartcase

set encoding=utf-8

" " set completeopt=menu,menuone
set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview		" remove the preview/scratch window
set mouse=a				" For those lazy days
set nu

" autocmd Filetype qf setlocal norelativenumber nonumber

""""""""""""""""""""""""""""""""
" Window managent              "
""""""""""""""""""""""""""""""""
" set splitright
" set splitbelow


""""""""""""""""""""""""""""""""
" Theming
""""""""""""""""""""""""""""""""
" syntax on
" colorscheme off
"set termguicolors		" to support molokai theme
colorscheme molokai


""""""""""""""""""""""""""""""""
" Key-mapping                  "
""""""""""""""""""""""""""""""""
let mapleader=','
nmap <space> :noh<CR>		" use space to clear last search hightlight

" nnoremap <leader>w :bn<CR>
" nnoremap <leader>q :bp<CR>
nnoremap ; :
inoremap jk <ESC>

" map <C-j> :cnext<CR>
" map <C-k> :cprevious<CR>
nnoremap <leader>c :cclose<CR>
nnoremap <leader>ev :tabe ~/workspace/repos/vimrc/vimrc<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>


function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#test#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>vr  <Plug>(go-run)
autocmd FileType go nmap <leader>vt  <Plug>(go-test)
autocmd FileType go nmap <leader>t :Dispatch go test<CR>
autocmd FileType go nmap <leader>r :Dispatch go run %<CR>
" autocmd FileType go let b:dispatch = 'go test'

""""""""""""""""""""""""""""""""
" Misc-settings                "
""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
" " For editing .yml files 
" autocmd BufNewFile,BufRead *.yml setlocal expandtab tabstop=4 shiftwidth=4
"
"

" Python configuration
au BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
