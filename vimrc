"""""""""""""""""""""""""""""""""
" Plugins                       "
"""""""""""""""""""""""""""""""""
if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

Plug 'fatih/molokai'
Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'
" Plug 'Raimondi/delimitMate'
Plug 'pbrisbin/vim-colors-off'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'easymotion/vim-easymotion'

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Plug 'zchee/deoplete-go', { 'do': 'make'}

call plug#end()


""""""""""""""""""""""""""""""""
" Plugin settings              "
""""""""""""""""""""""""""""""""
" let g:deoplete#enable_at_startup = 1
let g:go_fmt_command = "goimports"

""""""""""""""""""""""""""""""""
" Vim settings                 "
""""""""""""""""""""""""""""""""
" cannot live without
" set nocompatible		" not applicable to neovim
" filetype off
" filetype plugin indent on
" set wildmenu
" set path+=**
" set autowrite
" set autoread
" set hidden

" " less important
" set noswapfile
" set background=dark
" set showcmd

" set ignorecase
" set smartcase
" " set completeopt=menu,menuone
" set mouse=a	" For those lazy days

" autocmd Filetype qf setlocal norelativenumber nonumber

""""""""""""""""""""""""""""""""
" Window managent              "
""""""""""""""""""""""""""""""""
" set splitright
" set splitbelow


""""""""""""""""""""""""""""""""
" Styling                      "
""""""""""""""""""""""""""""""""
" syntax on
" colorscheme off
"set termguicolors		" to support molokai theme


""""""""""""""""""""""""""""""""
" Key-mapping                  "
""""""""""""""""""""""""""""""""
" let mapleader=','

" nnoremap <leader>w :bn<CR>
" nnoremap <leader>q :bp<CR>
" nnoremap ; :
" inoremap jk <ESC>

" map <C-j> :cnext<CR>
" map <C-k> :cprevious<CR>
" nnoremap <leader>c :cclose<CR>

" function! s:build_go_files()
"   let l:file = expand('%')
"   if l:file =~# '^\f\+_test\.go$'
"     call go#test#Test(0, 1)
"   elseif l:file =~# '^\f\+\.go$'
"     call go#cmd#Build(0)
"   endif
" endfunction

" autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
" autocmd FileType go nmap <leader>r  <Plug>(go-run)
" autocmd FileType go nmap <leader>g  <Plug>(go-test)
" autocmd FileType go nmap <leader>t :Dispatch<cr>
" autocmd FileType go let b:dispatch = 'go test'

""""""""""""""""""""""""""""""""
" Misc-settings                "
""""""""""""""""""""""""""""""""

" autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
" " For editing .yml files 
" autocmd BufNewFile,BufRead *.yml setlocal expandtab tabstop=4 shiftwidth=4
