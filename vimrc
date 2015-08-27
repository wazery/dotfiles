" Allow local customizations in ~/.vimrc_local
let $LOCALFILE=expand('~/.vimrc_local')
if filereadable($LOCALFILE)
    source $LOCALFILE
endif

set nocompatible      " We're running Vim, not Vi! .. be iMproved
filetype off          " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/ScrollColors'
Plugin 'vim-scripts/tComment'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-haml'
Plugin 'bling/vim-airline'
Plugin 'vim-ruby/vim-ruby'
Plugin 'terryma/vim-expand-region'
Plugin 'wincent/Command-T'
Plugin 'mattn/emmet-vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'kien/ctrlp.vim'
Plugin 'zw/vim-tags'
Plugin 'SirVer/ultisnips'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'honza/vim-snippets'
Plugin 'mhinz/vim-startify'
Plugin 'plasticboy/vim-markdown'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'sjl/gundo.vim'
Plugin 'majutsushi/tagbar'
Plugin 'duythinht/inori'
Plugin 'scrooloose/nerdtree'

" Color Schemes
Plugin 'morhetz/gruvbox'
Plugin 'daylerees/colour-schemes'
Plugin 'romainl/Apprentice'

" Keep Plugin commands between vundle#begin/end.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Auto set the current directory from the current file
set autochdir

" NERDTree configs
let NERDTreeShowHidden=1
let NERDTreeChDirMode=2

" Remove toolbar, scrollbar, etc..
set guioptions-=L
set guioptions-=r
set guioptions-=T

" Convert tabs into 2 spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

" Remove Vim's tooltip
set noballooneval

" Map leader key to comma
let mapleader=','

" Leader key mappings
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader>b :TagbarToggle<CR>
nmap <Leader>n :NERDTreeToggle<CR>

nnoremap <leader>. :CtrlPTag<CR>

" Buffer/Tab navigation 
" , + w closes buffer
nnoremap <leader>w :bd<CR>
" , + w closes location buffer
nnoremap <leader>l :lclose<CR>
" , + q closes all buffers
nnoremap <leader>q :%bd<CR>
" , + , + q closes all
nnoremap <leader><leader>q :qa<CR>

" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>j :bnext<CR>
" Move to the previous buffer
nmap <leader>k :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Region expanding
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Remove last search highlighting, when hitting return
nnoremap <CR> :set hlsearch!<CR>

" Stop the stupid window from openning up while quiting
map q: :q

" Use ack instead of grep
set grepprg=ack

" Add custom commands to Rails.vim
command! Rroutes :RE config/routes.rb
command! RTroutes :RTedit config/routes.rb
command! Rgem :RE Gemfile

" Reload vim configurations command
command! Reload :source ~/.vimrc
" Or
nnoremap <leader>r :source ~/.vimrc<CR>

" Current line highlight
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" Tab settings: tab-width is 2 and expand <tab> to spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Automatic switching between absolute and relative mode
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Disable swap file creation
set noswapfile

" Set project specific backup dir
silent execute '!mkdir "'.$VIMRUNTIME.'/temp"'
silent execute '!del "'.$VIMRUNTIME.'/temp/*~"'
set backupdir=~/.vim/backups " backup path
"set backupdir=$VIMRUNTIME/temp//
"set directory=$VIMRUNTIME/temp//

" Airline config
let g:airline_theme='gruvbox'
" let g:airline_theme='gotham'
" let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" CtrlP plugin config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" CTags configs
let g:vim_tags_auto_generate = 1
set tags=./tags;

" UtilSnips configs
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" Gruvbox colorscheme conifigs
let g:gruvbox_termcolors=16

" Color scheme
"colorscheme apprentice
"colorscheme inori
colorscheme gruvbox
set background=dark

" Gundo shortcut
nnoremap <Leader>u :GundoToggle<CR>
let g:gundo_preview_bottom = 1
let g:gundo_close_on_revert = 1
let g:gundo_width = 30
let g:gundo_preview_height = 40

set undofile                   " Save undos after file closes
set undodir=$HOME/.vim/undo    " Where to save undo histories
set undolevels=1000            " How many undos
set undoreload=10000           " Number of lines to save for undo
set lines=60 columns=160       " Set default initial window size
set guifont=Menlo\ Regular:h15 " Set default font size
set noeb vb                    " Show matching bracket
set showmatch                  " Show matching bracket
set laststatus=2               " Show status line
set ruler

" Everyday typos handling
command W w
command Q q
command WQ wq
command Wq wq

" Smooth mouse scrolling
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Smooth keyboard scrolling
function SmoothScroll(up)
    if a:up
        let scrollaction="^Y"
    else
        let scrollaction="^E"
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 10m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction

nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>
inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i
