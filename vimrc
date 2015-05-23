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
Plugin 'bling/vim-airline'
Plugin 'daylerees/colour-schemes'
Plugin 'terryma/vim-expand-region'
Plugin 'wincent/Command-T'
Plugin 'mattn/emmet-vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'kien/ctrlp.vim'
Plugin 'zw/vim-tags'
Plugin 'vim-ruby/vim-ruby'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Keep Plugin commands between vundle#begin/end.
 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Auto set the current directory from the current file
set autochdir

" Remove toolbar, scrollbar, etc..
set guioptions-=L
set guioptions-=r
set guioptions-=T

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

" Region expanding
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

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

" Set project specific backup dir
silent execute '!mkdir "'.$VIMRUNTIME.'/temp"'
silent execute '!del "'.$VIMRUNTIME.'/temp/*~"'
set backupdir=$VIMRUNTIME/temp//
set directory=$VIMRUNTIME/temp//

" Airline config
" let g:airline_theme='gotham'
" let g:airline_powerline_fonts=1
" let g:airline#extensions#hunks#non_zero_only = 1
" let g:lightline = { 'colorscheme': 'gotham' }

" CtrlP plugin config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Ctags configs
let g:vim_tags_auto_generate = 1
set tags=./tags;

" UtilSnips configs
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Color scheme
colorscheme gruvbox "gotham
set background=dark

" Set default initial window size
set lines=60 columns=160

" Set default font size
set guifont=Menlo\ Regular:h15

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
