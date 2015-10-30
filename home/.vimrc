syntax enable
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
