"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> Base installation
"    -> Vundle
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Editing mappings
"    -> Plugin specific
"    -> Helper functions
"    -> Sandbox area for testing
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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
    set rtp+=%USERPROFILE%/vimfiles/bundle/Vundle.vim/
    call vundle#begin('%USERPROFILE%/vimfiles\bundle\')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif
Plugin 'VundleVim/Vundle.vim'

" Plugin for nerdtree
Plugin 'scrooloose/nerdtree'

" Plugin for airline and themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Plugin for tab completion
Plugin 'ervandew/supertab'

" Plugin for commenting
Plugin 'scrooloose/nerdcommenter'

" Plugin for fuzzy search of files
Plugin 'kien/ctrlp.vim'

" Plugin for surrounding commands
Plugin 'tpope/vim-surround'

" Plugin for git commands working in the command line of vim
Plugin 'tpope/vim-fugitive'

" Plugin to add hex editing features
Plugin 'Shougo/vinarise.vim'

" Plugin to show detailed information about git repos
Plugin 'junegunn/gv.vim'

" Plugin to show line numbers only in current window
Plugin 'auwsmit/vim-active-numbers'

" Plugin to navigate in vim and tmux without further actions
Plugin 'christoomey/vim-tmux-navigator'

" Plugin for asynchronous code checking
Plugin 'w0rp/ale'

" Plugin for showing vim changes in the gutter
Plugin 'airblade/vim-gitgutter'

" Plugin for showing indent lines
Plugin 'Yggdroot/indentLine'

" Plugin for automatically inserting brackets, quotation marks, ...
Plugin 'jiangmiao/auto-pairs'

" Plugin for displaying a minimap on the right side
Plugin 'severin-lemaignan/vim-minimap'

" Plugin which makes vim ready for LaTeX
Plugin 'lervag/vimtex'

" Plugin for showing and deleting trailing white spaces
Plugin 'ntpeters/vim-better-whitespace'

" Plugin for graphical undo history
Plugin 'mbbill/undotree'

" Plugin for tab completion of search strings
Plugin 'vim-scripts/SearchComplete'

" Plugin for making tables
Plugin 'godlygeek/tabular'

" Plugin for octave/matlab syntax highlighting
Plugin 'jvirtanen/vim-octave'

" Plugin for context aware pasting
Plugin 'sickill/vim-pasta'

" Plugin for snippets
if has ("gui_win32")
    "...
else
    Plugin 'SirVer/ultisnips' "engine for snippets
    Plugin 'honza/vim-snippets' "actual snippets
endif

" Plugin for search ans replace functionality across multiple files
Plugin 'brooth/far.vim'

" Plugin for running code tests (e.g. pytest, rspec, ...)
Plugin 'janko-m/vim-test'

" Plugin for molokai color scheme
Plugin 'tomasr/molokai'

" Plugin for managing to-do lists
Plugin 'aserebryakov/vim-todo-lists'

" Plugin to use the silver seacher
Plugin 'mileszs/ack.vim'

" Plugin for using ctags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

" Plugin for showing tags on the right side bar
Plugin 'majutsushi/tagbar'

" Plugin to toggle spell checking
Plugin 'leifdenby/vim-spellcheck-toggle'

" Plugin to close all buffer except the current one
Plugin 'vim-scripts/BufOnly.vim'

" Plugin for markdown formatting
Plugin 'SidOfc/mkdx'

" Plugin for asynchronous completion
Plugin 'maralla/completor.vim'

" Plugin which handles closing buffers and tabs
Plugin 'Asheq/close-buffers.vim'


" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto load .vimrc after saving
autocmd! bufwritepost .vimrc source %

" Sets how many lines of history VIM has to remember
set history=1000

" Use system clipboard for copying
set clipboard^=unnamed,unnamedplus

" Sets spellchecking for german/english
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

" Show trailing white spaces and eol signs, ...
au BufNewFile,BufRead *.* set list listchars=eol:¬,tab:\▸\ ,trail:~,extends:>,precedes:<

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

" Wordcompletion in list
set completeopt=longest,menuone

" Activare mouse suuport
set mouse=a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the WiLd menu
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

" Detect markdown language and activate syntax highlighting
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
endif

" Set color schemes
let base16colorspace=256
set t_Co=256
set background=dark
colorscheme molokai

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

" Apply a colorcolumn in light grey in the 81st and from 121st column on
let &colorcolumn="81,".join(range(121,9999),",")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define dirs for undo, backup and swap
if has ("gui_win32")
    set undodir=~/vimfiles/undo//
    set undofile
    set backupdir=~/vimfiles/backup//
    set directory=~/vimfiles/swp//
else
    set undodir=~/.vim/undo//
    set undofile
    set undolevels=100
    set backupdir=~/.vim/backup//
    set directory=~/.vim/swp//
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set shiftround
set softtabstop=4

" Auto indent
set ai

" Smart indent
set si

" Wrap lines and indent to same depth (works only in gui)
set wrap linebreak nolist
set breakindent

" Enable code folding
set foldmethod=syntax
set foldlevel=1

" Match angle brackets...
set matchpairs+=<:> "


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> # :call VisualSelection('f')<CR>
vnoremap <silent> * :call VisualSelection('b')<CR>

" Make indentations for the whole selected paragraph working
vnoremap < <gv
vnoremap > >gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close the current buffer
nnoremap <leader>bd :bd<cr>

" Close all the buffers
nnoremap <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove
nnoremap <leader>tN <esc>:tabprevious<CR>
nnoremap <leader>tn <esc>:tabnext<CR>
nnoremap <leader>oo :only<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

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

" Map the underscore to unhighlight after searching
nnoremap <silent> _ :nohl<CR>

" Map Ctrl-P to open fuzzy finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <M-j> mz:m+<cr>`z
nnoremap <M-k> mz:m-2<cr>`z
vnoremap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

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
nnoremap <leader>qb :CloseOtherBuffers<cr>

" Toggle the tagbar
nmap <leader>ct :TagbarToggle<CR>

" Toggle undo tree
nnoremap <leader>u :UndotreeToggle<cr>

" Trigger configuration for snippets. No use of <tab> if you use completement engine
"let g:UltiSnipsExpandTrigger='<leader>us'
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
if has ("gui_win32")
    " continue
else
    let g:SuperTabDefaultCompletionType    = '<C-n>'
    let g:SuperTabCrMapping                = 0
    let g:UltiSnipsExpandTrigger           = '<tab>'
    let g:UltiSnipsJumpForwardTrigger      = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
    let g:SuperTabCrMapping=1

    " If you want :UltiSnipsEdit to split your window.
    " let g:UltiSnipsEditSplit="vertical"
endif

" Make Ctrlp start from the current dir
let g:ctrlp_working_path_mode = 'c'

" ale settings for linting
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
"nmap <silent> <C-"k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Define powerline theme from airline extension
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'

" Have always the gutter-bar activate
set signcolumn=yes

" Define the |-character for use as indent line
let g:indentLine_char = '¦'

" Define key mappings for vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Correct spell errors:
function! FixLastSpellingError()
  normal! mm[s1z=`m"
endfunction
nnoremap <leader>sp :call FixLastSpellingError()<cr>


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
nnoremap <leader>f :call FoldColumnToggle()<cr>

" Don't automatically continue comments after newline (from Ben Orenstein)
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Sandbox area for testing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
