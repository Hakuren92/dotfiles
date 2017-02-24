" ____ Platform layer ____
" ========================
"
if has('win32')
	set backupdir=$HOME/vimfiles/backup,.
	set directory=$HOME/vimfiles/temp//,.
	set undodir=$HOME/vimfiles/undo,.
        set viewdir=$HOME/vimfiles/view,.
else
	set backupdir=~/.vim/backup,.
	set directory=~/.vim/temp//,.
	set undodir=~/.vim/undo,.
        set viewdir=~/.vim/view,.
endif

if has('win32')
	set guifont=Droid_Sans_Mono_Slashed_for_Pow:h10
endif

if has('win32')
	let my_plugged_path = '$HOME/vimfiles/plugged'
else
	let my_plugged_path = '~/.vim/plugged'
endif

if has('win32')
	let my_plug_path = '$VIM/autoload/plug.vim'
else
	let my_plug_path = '~/.vim/autoload/plug.vim'
endif

" ____ Plugins ____
" =================
"
if empty(glob(my_plug_path))
	silent !curl -fLo my_plug_path --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(my_plugged_path)

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
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/vim-stylus'

" Others
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'

" Removed plugins temporarily as polygot 'should' replace them
" Plug 'helino/vim-json'
" Plug 'pangloss/vim-javascript'

call plug#end()

" ____ Configuration ____
" =======================
"
let mapleader = " "

" Start with a NERDTree window if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Add some make functions for different filetypes
autocmd FileType python :set makeprg=python\ % 
autocmd FileType python :set shellpipe= 

" Bind :make to a single button
nnoremap <F9> :make<CR>

" DelimitMate config
let delimitMate_expand_cr = 1

" Easy-align config
nmap gea <Plug>(EasyAlign)
vmap gea <Plug>(EasyAlign)

" Emmet config
nmap <leader>em <c-y>, " Launch emmet

" NERDTree config
nmap <leader>nt :NERDTree<CR>

" Ag config
nmap <leader><space> :Ag<space>

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
nnoremap <silent><F3> :lnext<CR>
inoremap <silent><F3> <C-O>:lnext<CR>
vnoremap <silent><F3> :lnext<CR>

" show previous jshint error
nnoremap <silent><F2> :lprevious<CR>
inoremap <silent><F2> <C-O>:lprevious<CR>
vnoremap <silent><F2> :lprevious<CR>

" Navigate between vim windows.
map <silent> <leader>h :wincmd h<CR>
map <silent> <leader>l :wincmd l<CR>
map <silent> <leader>j :wincmd j<CR>
map <silent> <leader>k :wincmd k<CR>

noremap <leader>q :bp<CR>      " Previous buffer
noremap <leader>w :bn<CR>      " Next buffer

" Resize windows in normal mode using the arrow keys.
nnoremap <Up>    <C-w>+
nnoremap <Down>  <C-w>-
nnoremap <Left>  <C-w><
nnoremap <Right> <C-w>>

" Move in display lines instead of text lines
nnoremap <silent> j gj
nnoremap <silent> k gk

" ____ Settings ____
" ==================
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
set foldmethod=syntax          " Make file foldable by syntax
set nofoldenable " Do not fold on load

" ____ Interface Settings ____
" ============================
"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_theme='one'
set background=light
colors one
highlight IncSearch guibg=green

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Reload .vimrc without restarting. Useful during development
nmap <leader><F12> :so $MYVIMRC<CR>
