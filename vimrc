"""""""""""""""""""""""""""""""""
" Plugins                       "
"""""""""""""""""""""""""""""""""
if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'easymotion/vim-easymotion'
Plug 'sebdah/vim-delve'

Plug 'deanmaniatis/vim-colors-mania'
Plug 'fatih/molokai'
Plug 'pbrisbin/vim-colors-off'
call plug#end()


""""""""""""""""""""""""""""""""
" Plugin settings              "
""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"

""""""""""""""""""""""""""""""""
" Vim settings                 "
""""""""""""""""""""""""""""""""
" cannot live without
" set nocompatible		" not applicable to neovim
filetype off
filetype plugin indent on
set wildmenu
set path+=**
set autowrite	"go-build/run autosaves file"
set autoread
set hidden

" " less important
set noswapfile
set background=dark
set showcmd

set cursorline
set ignorecase
" set smartcase
" " set completeopt=menu,menuone
set mouse=a	" For those lazy days

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

" nnoremap <leader>w :bn<CR>
" nnoremap <leader>q :bp<CR>
nnoremap ; :
inoremap jk <ESC>

" map <C-j> :cnext<CR>
" map <C-k> :cprevious<CR>
nnoremap <leader>c :cclose<CR>
nnoremap <leader>ev :tabe ~/workspace/repos/vimrc/vimrc<CR>


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
