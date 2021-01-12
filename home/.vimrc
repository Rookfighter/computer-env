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

" configure plugins
" =================

call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes', { 'do' : 'mkdir -p ~/.vim/colors && cp  colors/* ~/.vim/colors' }

call plug#end()
