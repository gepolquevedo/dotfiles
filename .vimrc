set tabstop=4
set expandtab
set softtabstop=4

" Personal default colorscheme
colorscheme delek

" Show command options when you press tab
set wildmenu

" Show relative number, except for the line on the cursor's location
set number relativenumber
set nu rnu

filetype indent on

" highlight chars while typing for search
set incsearch

" highlight search matches
set hlsearch

" show tabs and trailing spaces as special chars for easier editing
set listchars=tab:>.,nbsp:_,trail:.,tab:\|\ 

" persist char list settings
set list

" allow buffer switch with pending changes
set hidden

set nofoldenable
set foldmethod=indent

" always ignore case
set ignorecase

" display a column at char 80 to encourage line length
set colorcolumn=80

" display a column hightlight on the cursor location
set cursorcolumn

set t_Co=256
syntax enable

" change working directory upon buffer change
" set autochdir

"Use a line cursor within insert mode and a block cursor everywhere else.
"
"" Reference chart of values:
""   Ps = 0  -> blinking block.
""   Ps = 1  -> blinking block (default).
""   Ps = 2  -> steady block.
""   Ps = 3  -> blinking underline.
""   Ps = 4  -> steady underline.
""   Ps = 5  -> blinking bar (xterm).
""   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" allow for persistent undo folder
if has ('persistent_undo')
  set undodir=$HOME/.vim/undo
  set undofile
endif

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

" automatically open NerdTree when opening a file or folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd BufWinEnter * silent NERDTreeMirror
