set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/nerdcommenter'

Plugin 'mhinz/vim-signify'

Plugin 'tpope/vim-surround'

Plugin 'scrooloose/syntastic'

call vundle#end()            " required
filetype plugin indent on    " required

set ruler

set backspace=eol,start,indent

set encoding=utf8

syntax enable 

set termguicolors

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme gruvbox
catch
endtry

set background=dark

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set expandtab
set shiftwidth=4
set tabstop=4

set number

set updatetime=1000

" Airline configuration

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Signify configuration

"let g:signify_realtime = 1 "[WS] Performance could be better...

" syntastic configuration

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Mappings

map <C-n> :NERDTreeToggle<CR>

