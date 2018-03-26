"*******************************************************************************
" Title: .vimrc
" Description: vim configuration file
" Author: Sebastian Sonntag
" Date: 2018-03-25
" License:
"*******************************************************************************


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Install Vundle in case it is not installed already
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_win32")
    " continue
else
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#rc()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :PluginInstall
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
if has ("gui_win32")
    set rtp+=$HOME/.vim/bundle/Vundle.vim/
    call vundle#begin('$HOME/.vim\bundle\')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

" Main Vundle program
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'                " file and folder tree on the left side
Plugin 'vim-airline/vim-airline'            " adding the airline
Plugin 'vim-airline/vim-airline-themes'     " set of themes for airline
Plugin 'ervandew/supertab'                  " tab completion
Plugin 'scrooloose/nerdcommenter'           " commenting lines in and out
Plugin 'kien/ctrlp.vim'                     " fuzzy file search
Plugin 'tpope/vim-surround'                 " surrounding commands
Plugin 'tpope/vim-fugitive'                 " git commands working in the command line of vim
Plugin 'Shougo/vinarise.vim'                " hex editing features
Plugin 'junegunn/gv.vim'                    " show detailed information about git repos
Plugin 'auwsmit/vim-active-numbers'         " show line numbers only in current window
Plugin 'christoomey/vim-tmux-navigator'     " navigate in vim and tmux without further actions
Plugin 'w0rp/ale'                           " asynchronous code checking
Plugin 'mhinz/vim-signify'                  " showing  changes in the gutter
Plugin 'Yggdroot/indentLine'                " showing indent lines
Plugin 'jiangmiao/auto-pairs'               " automatically inserting brackets, quotation marks, ...
Plugin 'lervag/vimtex'                      " adding LaTeX features
Plugin 'ntpeters/vim-better-whitespace'     " showing and deleting trailing white spaces
Plugin 'mbbill/undotree'                    " graphical undo history
Plugin 'vim-scripts/SearchComplete'         " tab completion of search strings
Plugin 'godlygeek/tabular'                  " arranging tables
Plugin 'jvirtanen/vim-octave'               " octave/matlab syntax highlighting
Plugin 'sickill/vim-pasta'                  " context aware pasting
Plugin 'brooth/far.vim'                     " search ans replace functionality across multiple files
Plugin 'janko-m/vim-test'                   " running code tests (e.g. pytest, rspec, ...)
Plugin 'tomasr/molokai'                     " molokai color scheme
Plugin 'aserebryakov/vim-todo-lists'        " managing to-do lists
Plugin 'majutsushi/tagbar'                  " display tags on the right side bar
Plugin 'leifdenby/vim-spellcheck-toggle'    " toggle spell checking
Plugin 'SidOfc/mkdx'                        " markdown formatting
Plugin 'gregsexton/gitv'                    " gitk like vim tool
Plugin 'MarcWeber/vim-addon-mw-utils'       " basic utils for addons -> used for snippets
Plugin 'tomtom/tlib_vim'                    " basic utils for addons -> used for snippets
Plugin 'garbas/vim-snipmate'                " snippet engine
Plugin 'honza/vim-snippets'                 " snippet collection
Plugin 'ludovicchabant/vim-gutentags'       " using ctags
Plugin 'pseewald/vim-anyfold'               " fold setup to work with various projects
Plugin 'tell-k/vim-autopep8'                " rearrange python code to mee the pep8 standards
Plugin 'jeetsukumaran/vim-buffergator'      " list open buffers and switch with directional keys
Plugin 'nanotech/jellybeans.vim'            " jelly beans color scheme
Plugin 'davidhalter/jedi-vim'               " python language agnostic completion


" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto load .vimrc after saving
autocmd! bufwritepost .vimrc source %

" Detect markdown language and activate syntax highlighting
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Enable tab/spaces settings
autocmd Filetype c,cpp,markdown,latex,ruby,vim,xml,html,xhtml setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Don't automatically continue comments after newline (from Ben Orenstein)
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Show trailing white spaces and eol signs, ...
autocmd BufNewFile,BufRead *.* set list listchars=eol:¬,tab:\▸\ ,trail:~,extends:>,precedes:<


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" Use system clipboard for copying
set clipboard^=unnamed,unnamedplus

" Sets spellchecking for German/English
setlocal spell spelllang=en_us
"setlocal spell spelllang=de_de

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

" Set relative line numbers
set relativenumber
set number
set numberwidth=5

" Set cursorline
set cursorline

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<CR>

" Fast quitting
nmap <leader>x :x<CR>

" Word completion in list
set completeopt=longest,menuone

" Activate mouse support
set mouse=a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set completeopt=menuone

" Use Silver Searcher instead of grep
set grepprg=ag


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
endif

" Set color schemes
set t_Co=256
set background=dark
colorscheme jellybeans

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set nicer font in Windows GUI
if has ("gui_win32")
    set guifont=Consolas:h10.5:cANSI
endif

" Set bigger font (still Menlo but with different size) in OS X
if has ("gui_macvim")
    set guifont=Menlo:h11
endif

" Apply a color column in light grey in the 81st and from 121st column on
"let &colorcolumn="81,".join(range(121,9999),",")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define dirs for undo, backup and swap
set undodir=~/.vim/undo//
set undofile
set undolevels=1000
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable rounding when doing shifts
set shiftround

" Use spaces instead of tabs
set expandtab

" Auto indent
set ai

" Smart indent
set si

" Wrap lines and indent to same depth (works only in gui)
set wrap linebreak nolist
set breakindent

" Match angle brackets...
set matchpairs+=<:> "


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> # :call VisualSelection('f')<CR>
vnoremap <silent> * :call VisualSelection('b')<CR>

" Make indentations for the whole selected paragraph working
vnoremap < <gv
vnoremap > >gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close the current buffer
nnoremap <leader>bd :bd<CR>

" Close all the buffers
nnoremap <leader>ba :1,1000 bd!<CR>

" Useful mappings for managing tabs
nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tm :tabmove
nnoremap <leader>tN <esc>:tabprevious<CR>
nnoremap <leader>tn <esc>:tabnext<CR>
nnoremap <leader>oo :only<CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Remember info about open buffers on close
set viminfo^=%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings / additional mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
nnoremap 0 ^

" Use ü to go to tag definition
nnoremap ü <C-]>

" Map the ESC key sequence to jk for faster leaving the insert mode
inoremap kj <Esc>

" Map the underscore to un-highlight after searching
nnoremap <silent> _ :nohl<CR>

" Map Ctrl-P to open fuzzy finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <M-j> mz:m+<CR>`z
nnoremap <M-k> mz:m-2<CR>`z
vnoremap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nnoremap <D-j> <M-j>
  nnoremap <D-k> <M-k>
  vnoremap <D-j> <M-j>
  vnoremap <D-k> <M-k>
endif

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Complete whole filenames/lines with a quicker shortcut key in insert mode
inoremap <C-f> <C-x><C-f>
inoremap <C-l> <C-x><C-l>

" Fix "spelling" errors
cnoremap Q q
cnoremap Q! q!
cnoremap W w
cnoremap Wq wq


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load Nerdtree on Ctrl+n and load path of the actual file
nnoremap <C-n> :NERDTreeToggle<CR>
set autochdir
let NERDTreeChDirMode=2

" Make easytags to work asynchronously
let g:easytags_async = 1
" Make easytags to work on save
"let g:easytags_events = ['BufWritePost']

" delete all open buffers except this
nnoremap <leader>bo :bufdo bd<CR>

" Toggle the tagbar
nmap <leader>ct :TagbarToggle<CR>

" Toggle undo tree
nnoremap <leader>u :UndotreeToggle<CR>

" gutentag statusline
set statusline+=%{gutentags#statusline('[Generating...]')}

" Make Ctrlp start from the current dir
let g:ctrlp_working_path_mode = 'c'

" ale settings for linting
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"nmap <silent> <C-"k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_python_flake8_executable = 'python3' " 'python' for python2
let g:ale_python_flake8_options = '-m flake8'
let g:ale_linters = {
  \ 'python': ['flake8'] ,
  \ }

" Define powerline theme from airline extension
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='jellybeans'

" Have always the gutter-bar activated
set signcolumn=yes

" Signify - general
let g:signify_realtime = 1
let g:signify_cursorhold_normal = 0
let g:signify_cursorhold_insert = 0

" Signify - highlight lines in Sy and vimdiff etc.)
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227

" Signify - highlight signs in Sy
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Define the |-character for use as indent line
let g:indentLine_char = '¦'

" Define key mappings for vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" set folding methods
let anyfold_activate=1
set foldlevel=1

" Make jedi suggestions to pop up with supertab
let g:SuperTabDefaultCompletionType = "context"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Correct spell errors:
function! FixLastSpellingError()
  normal! mm[s1z=`m"
endfunction
nnoremap <leader>sp :call FixLastSpellingError()<CR>


" Delete trailing white space on save for the relevant file types
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


function! FoldColumnToggle()
    if &foldcolumn
        let g:last_fold_column_width = &foldcolumn
        setlocal foldcolumn=0
    else
        let &l:foldcolumn = g:last_fold_column_width
    endif
endfunction
let g:last_fold_column_width = 4  " Pick a sane default for the foldcolumn
nnoremap <leader>f :call FoldColumnToggle()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Sandbox area for testing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
