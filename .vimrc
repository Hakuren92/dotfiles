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

" Utility plugins 
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/syntastic'

" Autocomplete
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'

"Syntax help
Plug 'helino/vim-json'
Plug 'pangloss/vim-javascript'

call plug#end()

let mapleader = " "

" Easy-align config
nmap ga <Plug>(EasyAlign)

syntax on
filetype plugin indent on
