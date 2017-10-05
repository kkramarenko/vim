" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
set nocompatible
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"-------------------------
"General settings 
"-------------------------
set number
set colorcolumn=80
colorscheme desert
set tabstop=2 shiftwidth=2 expandtab
set incsearch
set hlsearch
set scrolloff=5
set enc=utf-8 
" Hide menus, toolbars, scrollers
set guioptions-=m
set guioptions-=T
set guioptions-=r
" Turnoff bells and blindings
set visualbell t_vb=
set novisualbell


filetype off

"if has("mac")
set guifont=Consolas:h13
"set fuoptions=maxvert,maxhorz
"endif

tab sball
set switchbuf=useopen
"-------------------------
" Vundle settings
" ------------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vim plugin manager
Plugin 'gmarik/Vundle.vim'
" Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Side tag window
Plugin 'majutsushi/tagbar'
" For git
Plugin 'tpope/vim-fugitive'
" Terminal for python interp
"Plugin 'rosenfeld/conque-term'
" Python
"Plugin 'klen/python-mode'
"Plugin 'davidhalter/jedi-vim'
Plugin 'mitsuhiko/vim-jinja'
"Plugin 'mitsuhiko/vim-python-combined'
" Surround with brakets
Plugin 'tpope/vim-surround'
" Great for moving around the page
Plugin 'Lokaltog/vim-easymotion'
" Autocompletion
"Plugin 'Valloric/YouCompleteMe'
" Task list
Plugin 'fisadev/FixedTaskList.vim'
" Undo Tree
"Plugin 'mbbill/undotree'
" Google Translate
"Plugin 'maksimr/vim-translator'
" Delimitmate
Plugin 'raimondi/delimitmate'
" Quick scope
Plugin 'unblevable/quick-scope' 
" Vim exec
Plugin 'samtebbs33/vim-exec'
" Omni completion
Plugin 'OmniCppComplete'
" Latex preview
Plugin 'alxhnr/latex_preview'
call vundle#end()

set nocp
filetype on
filetype plugin on
filetype plugin indent on
"set omnifunc=syntaxcomplete#Complete

"--------------------------
" settings for Vim-Airline
" -------------------------
set laststatus=2
let g:airline_theme = 'dark'
let g:airline_enable_fugitive = 1
let g:airline_fugitive_prefix = '⎇  '
let g:airline_powerline_fonts = 1
let g:airline_section_c = '%t'
let g:airline_extensions = ['branch', 'tabline']
let g:airline#extensions#tabline#enable = 1
"let g:airline#themes#dark#palette={}
let g:airline#extensions#tabline#formatter = 'unique_tail'
"set t_Co=256

" NerdTree settings
map <F3> :NERDTreeToggle ./<CR>
let NERDTreeIgnore = ['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" TagBar settings
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0

"------------------------
" Python-mode settings
" -----------------------
"  turn-off autocompletion
"let g:pymode_rope = 0
"let g:pymode_rope_completion = 0
"let g:pymode_rope_complete_on_dot = 0
" documentation
"let g:pymode_doc = 0
"let g:pymode_doc_key = 'K'
" code checking
"let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes, pep8"
"let g:pymode_lint_ignore = "E501,W601,C0110"
"let g:pymode_lint_write = 1
" support of virtualenv
"let g:pymode_virtualenv = 1
" breakpoints settings
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_key = '<leader>b'
" syntax highlightning
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all
" turn-off autofold 
"let g:pymode_folding = 0
" Enable code runing
"let g:pymode_run = 0

" Jedi-vim settings
"let g:jedi#popup_select_first = 0

" Undo tree
"if has("persistent_undo")
"  set undodir=~/.undodir/
"  set undofile
"endif

" Search right tag file
set tags=./tags;,tags; 

"--------------------------
" User hotkeys
" -------------------------
" autocompletion
"inoremap <C-q> <C-x><C-o>
" run shell for python
"nnoremap <F5> :ConqueTermSplit ipython2<CR>

" Task list
map <F2> :TaskList<CR>

" Undo Tree
"nnoremap <F6> :UndotreeToggle<CR>

" Vim exec
let g:vim_exec_key="<leader>e"

" Omni completion
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Folds
set foldenable
set foldmethod=syntax

