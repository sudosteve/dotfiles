" Great Practical Ideas for Computer Scientists
" Sample .vimrc file


" Ensure that we are in modern vim mode, not backwards-compatible vi mode
set nocompatible
set backspace=indent,eol,start
" filetype off " required for Vundle plugin manager

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'

" vim-c0 plugin on Github repo
" Plugin 'cmugpi/vim-c0'

" call vundle#end()

" Helpful information: cursor position in bottom right, line numbers on
" left
set ruler
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
" autocmd Filetype htmldjango setlocal sts=2 sw=2 expandtab

set colorcolumn=81
set mouse=a         " mouse scrolling

" Show multicharacter commands as they are being typed
set showcmd

set splitbelow splitright

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

