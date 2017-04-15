"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> Vundle
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
if has ("gui_win32")
    set rtp+=%USERPROFILE%/vimfiles/bundle/Vundle.vim/
    call vundle#begin('C:\Users\desonnse\vimfiles\bundle\')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif
Plugin 'VundleVim/Vundle.vim'"


" Plugin for color scheme(s) from GitHub repo
Plugin 'pkukulak/idle'

" Plugin for color schemes(s) from GitHub repo
Plugin 'chriskempson/base16-vim'

" Plugin for color schemes(s) from GitHub repo
Plugin 'notpratheek/vim-sol'

" Plugin for color schemes(s) from GitHub repo
Plugin 'jonathanfilip/vim-lucius'

" Plugin for color schemes(s) from GitHub repo
Plugin 'tomsik68/vim-crystallite'

" Plugin for color schemes(s) from GitHub repo
Plugin 'evgenyzinoviev/vim-vendetta'

" Plugin for color schemes(s) from GitHub repo
Plugin 'blerins/flattown'

" Plugin for color schemes(s) from GitHub repo
Plugin 'tomasr/molokai'

" Plugin for color schemes(s) from GitHub repo
Plugin 'wimstefan/Lightning'

" Plugin for color schemes(s) from GitHub repo
Plugin 'flazz/vim-colorschemes'

" Plugin for nerdtree from GitHub repo
Plugin 'scrooloose/nerdtree'

" Plugin for airline and themes from GitHub repo
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Plugin for tab completion from GitHub repo
Plugin 'ervandew/supertab'

" Plugin for commenting from GitHub repo
Plugin 'scrooloose/nerdcommenter'

" Plugin for fuzzy search of files from GitHub repo
Plugin 'kien/ctrlp.vim'

" Plugin for sourrunding commands from GitHub repo
Plugin 'tpope/vim-surround'

" Plugin for easy moving in documents with motions from GitHub repo
Plugin 'easymotion/vim-easymotion'

" Plugin for git commands working in the command line of vim from GitHub repo
Plugin 'tpope/vim-fugitive'

" Plugin for syntastic code checking from GitHub repo
Plugin 'scrooloose/syntastic'

" Plugin for showing vim changes in the gutter from GitHub repo
Plugin 'airblade/vim-gitgutter'

" Plugin for showing indent lines from GitHub repo
Plugin 'yggdroot/indentline'

" Plugin for automatically inserting brackets, quotation marks, ... from GitHub repo
Plugin 'jiangmiao/auto-pairs'

" Plugin for displaying a minimap on the right side from GitHub repo
Plugin 'severin-lemaignan/vim-minimap'

" Plugin for showing and deleting trailing white spaces
Plugin 'ntpeters/vim-better-whitespace'

" Plugin for graphical undo history
Plugin 'sjl/gundo.vim'

" Plugin for tab completion of search strings
Plugin 'vim-scripts/SearchComplete'

" Plugin for correct folding of code
Plugin 'tmhedberg/SimpylFold'

" Plugin for code intelligent completion
Plugin 'valloric/youcompleteme'

" Plugin for making tables
Plugin 'godlygeek/tabular'

" Plugin to autosave and autoload files
"Plugin 'xolox/vim-session'

" Plugin for setting and navigating marks
Plugin 'kshenoy/vim-signature'

" Plugin for octave/matlab syntax highlighting from GitHub repo
Plugin 'jvirtanen/vim-octave'

" Plugin for org mode
Plugin 'jceb/vim-orgmode'


" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets default font and font size
"set guifont=Monospace:h14

" Auto load .vimrc after saving
autocmd! bufwritepost .vimrc source %

" Sets how many lines of history VIM has to remember
set history=1000

" Sets spellchecking for german/english
setlocal spell spelllang=en_us
"setlocal spell spelllang=de_de

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Check with syntastic when open document
"let g:syntastic_check_on_open = 1

" Set hight of the syntastic error pane
let g:syntastic_loc_list_height=3

" Set relative line numbers
set relativenumber
set number

" Highlight current line
set cursorline

" Always show the status line
set laststatus=2

" Show trailing white spaces and eol signs, ...
au BufNewFile,BufRead *.* set list listchars=eol:¬,tab:\▸\ ,trail:~,extends:>,precedes:<

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Define powerline theme from airline extension
let g:airline_theme='dark'
"let g:airline_theme='solarized'

" Set to auto read when a file is changed from the outside
set autoread

" Use system clipboard for copy and paste in whole system
set clipboard^=unnamed,unnamedplus

" Fast saving
nmap <leader>w :w!<cr>

" Fast quitting
"nnoremap <leader>qq :wq!<cr>

" Word completion with tab
let g:SuperTabDefaultCompletionType = "<c-n>"

" Wordcompletion in list
set completeopt=longest,menuone

" Set options for syntastic code checker
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Have always the gutter-bar activate
let g:gitgutter_sign_column_always = 1

" Define the |-character for use as indent line
let g:indentLine_char = '¦'


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

" Load Nerdtree on Ctrl+n and load path of the actual file
map <C-n> :NERDTreeToggle<CR>
set autochdir
let NERDTreeChDirMode=2

" Save current session and reload files
"let g:session_autosave = 'yes'
"let g:session_autoload = 'yes'


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

" Set bigger font (still Menlo but +1) in OS X
if has ("gui_macvim")
    set guifont=Menlo:h12
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//


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
set wrap
if has("gui_running")
    set breakindent
endif

" Enable code folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> # :call VisualSelection('f')<CR>
vnoremap <silent> * :call VisualSelection('b')<CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Make indentations for the whole selected paragraph working
vnoremap < <gv
vnoremap > <gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Toggle graphical undo
nnoremap <C-u> :GundoToggle<CR>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>pt <esc>:tabprevious<CR>
map <leader>nt <esc>:tabnext<CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

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
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deactivate arrow keys
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

" Remap VIM 0 to first non-blank character
map 0 ^

" Map the ESC key sequence to jj for faster leaving the insert mode
imap jk <Esc>

" Map the underscore to unhighlight after searching
nnoremap <silent> _ :nohl<CR>

" Map Ctrl-P to open fuzzy finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Correct spell errors:
function! FixLastSpellingError()
  normal! mm[s1z=`m"
endfunction
nnoremap <leader>sp :call FixLastSpellingError()<cr>


" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


"function! CmdLine(str)
    "exe "menu Foo.Bar :" . a:str
    "emenu Foo.Bar
    "unmenu Foo
"endfunction


"function! VisualSelection(direction) range
    "let l:saved_reg = @"
    "execute "normal! vgvy"

    "let l:pattern = escape(@", '\\/.*$^~[]')
    "let l:pattern = substitute(l:pattern, "\n$", "", "")

    "if a:direction == 'b'
        "execute "normal ?" . l:pattern . "^M"
    "elseif a:direction == 'gv'
        "call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    "elseif a:direction == 'replace'
        "call CmdLine("%s" . '/'. l:pattern . '/')
    "elseif a:direction == 'f'
        "execute "normal /" . l:pattern . "^M"
    "endif

    "let @/ = l:pattern
    "let @" = l:saved_reg
"endfunction


" Returns true if paste mode is enabled
"function! HasPaste()
    "if &paste
        "return 'PASTE MODE  '
    "en
    "return ''
"endfunction
