filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType * match Error /\s+$/
autocmd BufWritePre * :%s/\s+$//e
