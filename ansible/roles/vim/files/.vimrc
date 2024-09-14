" line numbers
set number
set relativenumber

" syntax highlighting
syntax on

" Enable auto-indentation
set autoindent          " Maintain indentation from previous line
set smartindent         " Add extra indentation automatically in code blocks
set cindent             " More intelligent C-like indenting

" Enable line wrapping at convenient breaks
set wrap                " Wrap long lines
set linebreak           " Avoid wrapping in the middle of a word

" Enable incremental search and highlight search results
set incsearch           " Show search results as you type
set ignorecase          " Ignore case when searching...
set smartcase           " ...unless the search contains uppercase letters

" Highlight all matches when searching
set hlsearch

" Enable mouse support
set mouse=a             " Allow mouse usage in all modes

" Set a better status line
set laststatus=2        " Always show the status line

" Show matching parentheses/brackets
set showmatch           " Show matching brackets/parentheses

" Persistent undo
set undofile            " Maintain undo history between sessions
set undodir=~/.vim/undodir " Directory to store undo files

" Faster redrawing for better performance
set ttyfast

" For regular expressions turn magic on
set magic

set noerrorbells
set novisualbell

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Always show the status line
set laststatus=2

" Format the status line
set statusline=%{&paste?'[PASTE]':''}\ %F%m%r%h\ %w\ CWD:\ %r%{getcwd()}\ \ Line:\ %l\ \ Column:\ %c

" Set clipboard to use system clipboard (useful for copying between system and Vim)
set clipboard=unnamedplus

" Display trailing whitespace characters and tabs
set list                " Show special characters
set listchars=tab:→\ ,trail:• " Customize tab and trailing whitespace display

" Enable command auto-completion
set wildmenu            " Enhanced command-line completion
set wildmode=longest:full,full

" Enable folding (indent-based)
set foldmethod=indent
set foldlevel=99        " Don't fold by default, but allow folding

" Add visual and search enhancements
set showcmd             " Show incomplete commands in the bottom right
set ruler               " Show cursor position at the bottom

" Enable syntax-specific settings and automatic indentation
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab " Python-specific settings

" remapping (due to bépo layout)
noremap " 1
noremap « 2
noremap » 3
noremap ( 4
noremap ) 5
noremap @ 6
noremap + 7
noremap - 8
noremap / 9
noremap * 0
noremap = -
noremap % =
noremap b q
noremap é w
noremap p e
noremap o r
noremap è t
noremap ç y
noremap v u
noremap d i
noremap l o
noremap j p
noremap z [
noremap w ]
noremap a a
noremap u s
noremap i d
noremap e f
noremap , g
noremap c h
noremap t j
noremap s k
noremap r l
noremap n ;
noremap m '
noremap ê <
noremap à z
noremap y x
noremap x c
noremap . v
noremap k b
noremap ’ n
noremap q m
noremap g ,
noremap h .
noremap f /
noremap # ~
noremap 1 !
noremap 2 @
noremap 3 #
noremap 4 $
noremap 5 %
noremap 6 ^
noremap 7 &
noremap 8 *
noremap 9 (
noremap 0 )
noremap ° _
noremap ` +
noremap B Q
noremap É W
noremap P E
noremap O R
noremap È T
noremap Ç Y
noremap V U
noremap D I
noremap L O
noremap J P
noremap Z {
noremap W }
noremap A A
noremap U S
noremap I D
noremap E F
noremap ; G
noremap C H
noremap T J
noremap S K
noremap R L
noremap N :
noremap M "
noremap Ê >
noremap À Z
noremap Y X
noremap X C
noremap : V
noremap K B
noremap ? N
noremap Q M
noremap G <
noremap H >
noremap F ?


" Tab fait un Esc, Maj+Tab fait un Tab
inoremap <Tab> <Esc>
inoremap &lt;S-Tab> <Tab>

" Même chose, mais en mode visuel
vnoremap <Tab> <Esc>
vnoremap &lt;S-Tab> <Tab>
