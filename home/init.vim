call plug#begin('~/.vim/plugged')

" tree view of file system
Plug 'preservim/nerdtree'

" linting, language server communication
Plug 'dense-analysis/ale'

" display of git information
Plug 'airblade/vim-gitgutter'

" nice lean status bar
Plug 'nvim-lualine/lualine.nvim'

" vscode theme
Plug 'tomasiser/vim-code-dark'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

let mapleader = ","

" automatically keep indentation
filetype plugin indent on
syntax on

set exrc
set secure

colorscheme codedark

" lightline
set noshowmode
let g:lightline = { 'colorscheme': 'codedark' }

set ai

" editing core config
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set splitright


" always show the status bar
set laststatus=2

" always show line numbers
set number

" highlight trailing spaces
autocmd FileType * match Error /\s+$/
" cut trailing spaces on save
autocmd BufWritePre * :%s/\s+$//e

" custom keybindings
" ==================

" indent/unindent with tab/shift-tab
nnoremap <Tab> >>
inoremap <S-Tab> <Esc><<i
nnoremap <S-tab> <<

" search in files
nnoremap <C-k> <cmd>vsp<cr>

nnoremap <A-down> <cmd>m .+1<CR>==
nnoremap <A-up> <cmd>m .-2<CR>==
vnoremap <A-down> <cmd>m '>+1<CR>gv=gv
vnoremap <A-up> <cmd>m '<-2<CR>gv=gv

" deoplete
let g:deoplete#enable_at_startup = 1

" ale
let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang']
    \}

nnoremap <F12> <cmd>ALEGoToDefinition<cr>
nnoremap <C-S-F12> <cmd>ALEFindReferences<cr>

" nerdtree
nnoremap <leader>n <cmd>NERDTreeFocus<cr>
nnoremap <C-S-w> <cmd>NERDTree<cr>
nnoremap <C-e> <cmd>NERDTreeToggle<cr>
nnoremap <C-f> <cmd>NERDTreeFind<cr>

" telescope
nnoremap <c-p> <cmd>Telescope find_files<cr>
