colorscheme seti
syntax enable

set exrc
set secure

set background=light
set ai
" automatically keep indentation
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" highlight trailing spaces
autocmd FileType * match Error /\s+$/
" cut trailing spaces on save
autocmd BufWritePre * :%s/\s+$//e

" custom keybindings
nmap fc :%!clang-format-6.0 -style=file <CR>
nmap oo :NERDTreeFocus <CR>

" configure plugins
" =================

call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes', { 'do' : 'mkdir -p ~/.vim/colors && cp  colors/* ~/.vim/colors' }
Plug 'amiorin/vim-project'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe', { 'do' : 'python install.py' }
Plug 'vim-syntastic/syntastic'

call plug#end()

" configure vim-project
" =====================

set rtp+=~/.vim/bundle/vim-project/
let g:project_use_nerdtree = 1

" define workspace
call project#rc("~/develop")

Project 'optimization-cpp'
Project 'bayes-filter-cpp'
Project 'scan-matcher-cpp'
Project 'vbox/my_workspace/src/calibration_odom'

call project#rc()

" configure NERDTree
" ==================

let NERDTreeShowHidden=1

" configure YouCompleteMe
" =======================



" configure syntastic
" ===================

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
