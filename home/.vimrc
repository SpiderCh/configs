execute pathogen#infect()

set nocompatible
filetype off

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
try
	set wcm=
catch
endtry
menu SpellLang.RU_EN  :setlocal spell spelllang=ru,en
menu SpellLang.off :setlocal nospell
menu SpellLang.RU :setlocal spell spelllang=ru
menu SpellLang.EN :setlocal spell spelllang=en
map  :emenu SpellLang.
" Other
syntax on    " syntax on
set list

set backspace=indent,eol,start
set bs=2

if has('gui_running')
	set guioptions-=T 
	set guifont=Menlo
	set guioptions-=l
	set guioptions-=L
	set guioptions-=r
	set guioptions-=R
	set guioptions-=m
	set guitablabel=%M\ %t
endif

try
	set t_Co=256
	colorscheme wombat256mod
catch
	colorscheme evening
endtry
set hidden   " allow editing multiple unsaved buffers
filetype on  " automatic file type detection
set encoding=utf-8
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
set colorcolumn=128
set foldenable
set foldmethod=syntax
set vb t_vb=
autocmd VimEnter * set vb t_vb=
" space open/closes folds
nnoremap <space> za

if !isdirectory($HOME.'/.vim/temp')
	silent call mkdir ($HOME.'/.vim/temp', 'p')
endif
if isdirectory($HOME.'/.vim/temp')
	set directory=$HOME/.vim/temp
	set backupdir=$HOME/.vim/temp
	set viewdir=$HOME/.vim/temp
endif

if has("autocmd")
  augroup cssalias
    autocmd BufRead,BufNewFile *.qss set filetype=css
  augroup END
  augroup qrcalias
    autocmd BufRead,BufNewFile *.qrc set filetype=xml
  augroup END
  autocmd FileType python set tabstop=4 | set shiftwidth=4 | set softtabstop=4 | set expandtab | set autoindent | set fileformat=unix
endif

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
set clipboard=unnamed
