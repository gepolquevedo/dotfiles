set tabstop=4
set expandtab
set softtabstop=4

" Personal default colorscheme
colorscheme industry

" Show command options when you press tab
set wildmenu

set number relativenumber
set nu rnu

filetype indent on

set incsearch
set hlsearch

set listchars=tab:>.,nbsp:_,trail:.
set list

" allow buffer switch with pending changes
set hidden

set nofoldenable
set foldmethod=indent

set ignorecase

set colorcolumn=80

set t_Co=256
syntax enable

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do' : { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

let g:airline#extensions#tabline#enabled = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd BufWinEnter * silent NERDTreeMirror
