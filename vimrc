"""""""""""""""""""""""""""""""""
" Plugins                       "
"""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Plug 'fatih/molokai'
Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'
" Plug 'Raimondi/delimitMate'
Plug 'pbrisbin/vim-colors-off'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
call plug#end()


""""""""""""""""""""""""""""""""
" Plugin settings              "
""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
"let g:go_metalinter_autosave = 1
"let g:go_term_enabled = 1
" let g:go_term_mode = "split"
" let g:go_term_height = 10

" The following may impact performance
"let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_function_calls = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_extra_types = 1

""""""""""""""""""""""""""""""""
" Vim settings                 "
""""""""""""""""""""""""""""""""
" cannot live without
set nocompatible		" not applicable to neovim
filetype off
filetype plugin indent on
" set number
" set relativenumber
set wildmenu
set path+=**
set autowrite
set autoread
set hidden

" less important
set noswapfile
set background=dark
set showcmd

set ignorecase
set smartcase
set completeopt=menu,menuone

" autocmd Filetype qf setlocal norelativenumber nonumber

""""""""""""""""""""""""""""""""
" Window managent              "
""""""""""""""""""""""""""""""""
set splitright
set splitbelow


""""""""""""""""""""""""""""""""
" Styling                      "
""""""""""""""""""""""""""""""""
syntax off
colorscheme off
"set termguicolors		" to support molokai theme


""""""""""""""""""""""""""""""""
" Key-mapping                  "
""""""""""""""""""""""""""""""""
let mapleader=','

nnoremap <leader>w :bn<CR>
nnoremap <leader>q :bp<CR>
nnoremap ; :
inoremap jk <ESC>

map <C-j> :cnext<CR>
map <C-k> :cprevious<CR>
nnoremap <leader>c :cclose<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
" autocmd FileType go nmap <leader>t  <Plug>(go-test!)
autocmd FileType go nmap <leader>t :Dispatch<cr>
" autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go let b:dispatch = 'go test'

""""""""""""""""""""""""""""""""
" Misc-settings                "
""""""""""""""""""""""""""""""""
" to remove number lines from terminal and jump straight to insert mode
"if has('nvim')
"	" autocmd TermOpen * set nonumber
"	" autocmd TermOpen * set norelativenumber
"	"autocmd TermOpen * startinsert
"endif

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
" autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
" autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
" autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
" autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" For editing .yml files 
autocmd BufNewFile,BufRead *.yml setlocal expandtab tabstop=4 shiftwidth=4
