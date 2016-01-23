set nocompatible
filetype off

if isdirectory($HOME.'/.vim/bundle/')
	set rtp+=$HOME/.vim/bundle/Vundle.vim
	call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'scrooloose/nerdtree'
	Plugin 'Xuyuanp/nerdtree-git-plugin'
	Plugin 'airblade/vim-gitgutter'
	Plugin 'octol/vim-cpp-enhanced-highlight'
	Plugin 'vim-scripts/OmniCppComplete'
	"Plugin 'Valloric/YouCompleteMe'
	"Plugin 'rdnetto/YCM-Generator'
	call vundle#end()
endif

filetype plugin on
filetype indent on

set grepprg=grep\ -nH\ $*

set number
set background=dark
set nocp
set cul
set sh=/bin/zsh

" Tabs:
set autoindent
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set tabstop=4 " tabstops of 4
set shiftwidth=4 " indents of 4
set ts=4 " у меня табуляция 4 символа
" Search:
set hlsearch  " enable search highlight globally
set incsearch " show matches as soon as possible
set showmatch " show matching brackets when typing
set diffopt=filler,iwhite " ignore all whitespace and sync
" Spelling:
set wildmenu
set wcm=
menu SpellLang.RU_EN  :setlocal spell spelllang=ru,en
menu SpellLang.off :setlocal nospell
menu SpellLang.RU :setlocal spell spelllang=ru
menu SpellLang.EN :setlocal spell spelllang=en
map  :emenu SpellLang.
" Other
syntax on    " syntax on

set backspace=indent,eol,start
set bs=2

try
	set t_Co=256
	colorscheme wombat256mod
catch
endtry
set hidden   " allow editing multiple unsaved buffers
filetype on  " automatic file type detection
set encoding=utf8
set ffs=unix,dos,mac
set title
set autoread " watch for file changes by other programs
set ruler    " show the line number on bar
set nowrap " not wrap long lines
set backup
set hid
set smartcase
set lazyredraw
set magic
set textwidth=100
set colorcolumn=100
set foldmethod=syntax

if !isdirectory($HOME.'/.vim/temp')
	silent call mkdir ($HOME.'/.vim/temp', 'p')
endif
if isdirectory($HOME.'/.vim/temp')
	set directory=$HOME/.vim/temp
	set backupdir=$HOME/.vim/temp
	set viewdir=$HOME/.vim/temp
endif

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=T
set guitablabel=%M\ %t

" Добавляем локали для чтения не правильных файлов:
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
menu Encoding.CP1251   :e ++enc=cp1251<CR>
menu Encoding.CP866    :e ++enc=cp866<CR>
menu Encoding.KOI8-U   :e ++enc=koi8-u<CR>
menu Encoding.UTF-8    :e ++enc=utf-8<CR>
map :emenu Encoding.
" Делаем удобные биндинги для клавишь:
" Предыдущая вкладка
map <S-tab> :tabprevious<cr>
nmap <S-tab> :tabprevious<cr>
" Следующая вкладка:
map <C-tab> :tabnext<cr>
nmap <C-tab> :tabnext<cr>
" Закрыть вкладку:
map <S-t> :tabclose<cr>
set listchars=eol:¬,tab:▸▸,trail:~,extends:>,precedes:<,space:•
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
