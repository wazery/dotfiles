set nocompatible              " be iMproved, required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
 
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/ScrollColors'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
 
" Keep Plugin commands between vundle#begin/end.
 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Use ack instead of grep
set grepprg=ack

" Vim Rails related stuff
" Edit routes and Gemfile
command! Rroutes :RE config/routes.rb
command! RTroutes :RTedit config/routes.rb
command! Rgem :RE Gemfile

" Current line highlight
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" Tab settings: tab-width is 2 and expand <tab> to spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Remove last search highlighting, when hitting return
nnoremap <CR> :set hlsearch!<cr>

" Automatic switching between absolute mode and relative ones
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Airline config
let g:airline_theme='gotham'
let g:airline_powerline_fonts=1
let g:airline#extensions#hunks#non_zero_only = 1
let g:lightline = { 'colorscheme': 'gotham' }

" Color scheme
"colorscheme gotham
colorscheme gruvbox
set background=dark

" Set default initial window size
set lines=60 columns=160

" Set default font size
set guifont=Menlo\ Regular:h15

" Ctags related stuff
set tags=./tags;
