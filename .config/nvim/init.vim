" Great Practical Ideas for Computer Scientists
" Sample .vimrc file


" Ensure that we are in modern vim mode, not backwards-compatible vi mode
set nocompatible
set backspace=indent,eol,start
set number

"Enable filetype detection and syntax hilighting
syntax on
filetype on
filetype indent on
filetype plugin on

set expandtab
set shiftwidth=4
set softtabstop=4
filetype plugin indent on
autocmd Filetype htmldjango setlocal sts=2 sw=2 expandtab
autocmd Filetype html setlocal sts=2 sw=2 expandtab

set colorcolumn=81
set mouse=a         " mouse scrolling

" Show multicharacter commands as they are being typed
set showcmd

set splitbelow splitright

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

