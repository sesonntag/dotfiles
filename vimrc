"*******************************************************************************
" Title: vimrc
" Description: vim configuration file
" Author: Sebastian Sonntag
" Date: 2018-12-16
" License:
"*******************************************************************************


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Install vim-plug in case it is not installed already
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

if has("mac") || has("macunix") || has("unix")
  let vim_plug_just_installed = 0
  let vim_plug_path = expand('~/.vim/autoload/plug.vim')
  if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
  endif

  " manually load vim-plug the first time
  if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
  endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the runtime path to include Vim-plug and initialize
if has("mac") || has("macunix") || has("unix")
  call plug#begin('~/.vim/plugged')
elseif has("win32") || has("gui_win32")
  call plug#begin('~/AppData/Local/nvim/plugged')
endif

if has ('nvim')
  " completions
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " snippets
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
else
  " completions
  Plug 'lifepillar/vim-mucomplete'
endif

" file and folder tree on the left side
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'

" adding airline engine and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" commenting of lines or blocks
Plug 'scrooloose/nerdcommenter'

" add surroundings with vim style commands
Plug 'tpope/vim-surround'

" handle git repos from within
Plug 'tpope/vim-fugitive'

" hex features
Plug 'Shougo/vinarise.vim', { 'for': 'hex' }

" show detailed information about git repos
Plug 'junegunn/gv.vim'

" show line numbers only in current window
Plug 'auwsmit/vim-active-numbers'

" navigate in vim and tmux without further actions
Plug 'christoomey/vim-tmux-navigator'

" asynchronous linting engine
Plug 'w0rp/ale'

" showing file changes in the gutter in case it is handeld by vcs
Plug 'mhinz/vim-signify'

" jellybeans colorscheme
Plug 'nanotech/jellybeans.vim'

" one dark colorscheme
Plug 'joshdick/onedark.vim'

" showing indent lines
Plug 'Yggdroot/indentLine'

" correct identstion also in rare cases for python
Plug 'vim-scripts/indentpython.vim'

" add closing brackets, quotation marks, and co automatically
Plug 'jiangmiao/auto-pairs'

" add indexing to search results
Plug 'google/vim-searchindex'

" adding latex features
Plug 'lervag/vimtex', { 'for': 'latex' }

" highlighting trailling white spaces
Plug 'ntpeters/vim-better-whitespace'

" graphical undo tree
Plug 'simnalamburt/vim-mundo'

" tab completion on search
Plug 'vim-scripts/SearchComplete'

" octave/matlab syntax highlighting
Plug 'jvirtanen/vim-octave', { 'for': ['octave', 'matlab'] }

" indent araw pasting to not clutter the indentation depth
Plug 'sickill/vim-pasta'

" search and replace across multiple files
Plug 'brooth/far.vim'

" running code tests (e.g. pytest, rspec, ...)
Plug 'janko-m/vim-test'

" managing to-do lists
Plug 'aserebryakov/vim-todo-lists'

" display tags in the right side
Plug 'majutsushi/tagbar'

" gitk lik evim tool to dig into commits
Plug 'gregsexton/gitv'

" ctag support for vim
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

" fold setup to work with various different languages
Plug 'pseewald/vim-anyfold'

" rearrange python code to meet the pep8 standards
Plug 'tell-k/vim-autopep8', { 'for': 'python' }

" list currently open buffers and cycle through them with the directional keys
Plug 'jeetsukumaran/vim-buffergator'

" python language agnostic tools (goto, completion, ...)
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

" use anaconda python installation
Plug 'cjrh/vim-conda'

" do calculations inside of vim
Plug 'gregsexton/VimCalc'

" github colors (light)
Plug 'cormacrelf/vim-colors-github'


" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto load vim config after saving
if has ('nvim')
  autocmd! bufwritepost init.vim source $MYVIMRC
else
  autocmd! bufwritepost .vimrc source %
endif

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

" Activate any-fold from start up
autocmd Filetype * AnyFoldActivate


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

" Set relative line numbers
set relativenumber
set number
set numberwidth=5

" Use one space, not two, after punctuation.
set nojoinspaces

" Set cursorline
set cursorline

" enable autosave on vim startup
let g:auto_save = 1

" do not save in insert mode
let g:auto_save_in_insert_mode = 0

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

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use Silver Searcher instead of grep
set grepprg=ag


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set color schemes
set t_Co=256
set background=dark
colorscheme jellybeans

" set gui options when being in classical vim
if has("gui_running") && !has('nvim')
  set guioptions-=T
  set guioptions+=e
  set guitablabel=%M\ %t
endif

" Set nicer font in Windows GUI
if !has('nvim') && has("gui_win32")
  set guifont=Consolas:h10.5:cANSI
elseif !has('nvim') && has("gui_macvim")
  set guifont=Menlo:h11
endif

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Apply a color column in light grey in the 81st and from 121st column on
"let &colorcolumn="81,".join(range(121,9999),",")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define dirs for undo, backup and swap
if has("mac") || has("macunix") || has("unix")
  set undodir=~/.vim/undo//
  set backupdir=~/.vim/backup//
  set directory=~/.vim/swp//
elseif has("win32") || has("gui_win32")
  set undodir=~/AppData/Local/nvim/undo//
  set backupdir=~/AppData/Local/nvim/backup//
  set directory=~/AppData/Local/nvim/swp//
endif
set undofile
set undolevels=1000
set undoreload=10000

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
" => Moving around, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close the current buffer
nnoremap <leader>bd :bd<CR>

" Close all the buffers
nnoremap <leader>ba :1,1000 bd!<CR>

" Useful mappings for managing buffers
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bN :bp<CR>

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" use gj or gk to move lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Remember info about open buffers on close
set viminfo^=%

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings / additional mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
nnoremap 0 ^

" Use ü to go to tag definition
nnoremap ü <C-]>
nnoremap Ü <C-O>

" Map the ESC key sequence to jk for faster leaving the insert mode
inoremap kj <Esc>

" Map the underscore to un-highlight after searching
nnoremap <silent> _ :nohl<CR>

" Map Ctrl-P to open fuzzy finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <c-b> :CtrlPBuffer<CR>
let g:ctrlp_use_caching = 0

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

" Toggle the tagbar
nmap <leader>ct :TagbarToggle<CR>

" Toggle undo tree
nnoremap <leader>u :MundoToggle<CR>

" Make Ctrlp start from the current dir
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

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
set foldlevel=1

" jedi settings
let g:jedi#show_call_signatures = 2
let g:jedi#force_py_version = 3

" deoplete and neosnippet settings
if has ('nvim')
  let g:deoplete#enable_at_startup = 1
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " For conceal markers.
  if has('conceal')
    set conceallevel=2 concealcursor=niv
  endif

  " define python3 path
  if has("mac") || has("macunix") || has("unix")
    "let g:python3_host_prog = '~/.opt/miniconda3/bin/python' "necessary?
  elseif has("win32") || has("gui_win32")
    let g:python3_host_prog = 'C:\ProgramData\Miniconda3\envs\myenv_p36\python.exe'
  endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" correct spell errors:
function! FixLastSpellingError()
  normal! mm[s1z=`m"
endfunction
nnoremap <leader>sp :call FixLastSpellingError()<CR>


" delete trailing white space on save for the relevant file types
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" show folding depth on the left side
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


" toggle spellchecking
function! ToggleSpellCheck()
  setlocal spell! spelllang=en_us
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction

nnoremap <silent> <Leader>s :call ToggleSpellCheck()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Sandbox area for testing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
