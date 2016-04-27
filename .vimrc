" Config file for Vim
"

" ========================= Plugins
"
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" List all plugins with the 'Plug' command

" Navigation
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Utility plugins 
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/syntastic'
Plug 'Shutnik/jshint2.vim' " Is this conflicting with syn?
Plug 'skammer/vim-css-color'

" Autocomplete
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'

" Syntax help
Plug 'helino/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'

call plug#end()

" ============================= Configuration
"
let mapleader = " "

" Start with a NERDTree window if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Easy-align config
nmap ga <Plug>(EasyAlign)
vmap ga <Plug>(EasyAlign)

" Emmet config
nmap <leader>em <c-y>, " Launch emmet

" NERDTree config
nmap <leader>nt :NERDTree<CR>

" JSHint2 config
let jshint2_read       = 1
let jshint2_save       = 1
let jshint2_min_height = 3
let jshint2_max_height = 12

" jshint validation
nnoremap <silent><F1> :JSHint<CR>
inoremap <silent><F1> <C-O>:JSHint<CR>
vnoremap <silent><F1> :JSHint<CR>

" show next jshint error
nnoremap <silent><F2> :lnext<CR>
inoremap <silent><F2> <C-O>:lnext<CR>
vnoremap <silent><F2> :lnext<CR>

" show previous jshint error
nnoremap <silent><F3> :lprevious<CR>
inoremap <silent><F3> <C-O>:lprevious<CR>
vnoremap <silent><F3> :lprevious<CR>

" ================================ Settings
"
set nocompatible               " Set not compatible with vi
syntax on                      " Turn on syntax highlighting
filetype on
filetype plugin indent on
set autoread                   " Reload files written outside of vim
set encoding=utf8
set fileencoding=utf8
set backspace=indent,eol,start " Enable backspace to clear lots of stuff
set hidden                     " Hide abandoned buffers
set fileformat=unix            " Unix line endings
set incsearch                  " Incremental search
set hlsearch                   " Highlight search by defualt
set scrolloff=3
set expandtab                  " Use space instead of tab
set autoindent                 " Autoindentation. Mostly works
set smartindent                " Smart indent for c-like languages
set shiftwidth=4               " Tabs are 4 spaces
set softtabstop=4              " Same as above but in insert mode
set smartcase                  " Make searches not care about case unless case differs in search string
noremap <leader>q :bp<CR>      " Previous buffer
noremap <leader>w :bn<CR>      " Next buffer

" Reload .vimrc without restarting. Useful during development
nmap <leader><F12> :so $MYVIMRC<CR>
