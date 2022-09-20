"*******************************************************************************
" Title: vimrc
" Description: vim configuration file
" Author: Sebastian Sonntag
" Date: 2022-09-20
" License:
"*******************************************************************************


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => os specific stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32")
  " set python dll for plugins and internal hooks
  set pythonthreedll=python37.dll
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the runtime path to include Vim-plug and initialize
call plug#begin('~/.vim/plugged')

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

" easy alignment of trailing comments
Plug 'junegunn/vim-easy-align'

" adding light engine
Plug 'itchyny/lightline.vim'

" commenting of lines or blocks
Plug 'scrooloose/nerdcommenter'

" add surroundings with vim style commands
Plug 'tpope/vim-surround'

" add the repeat plugin for various plugins from tim pope
Plug 'tpope/vim-repeat'

" Plugin for unix commands to be activated from vim
Plug 'tpope/vim-eunuch'

" add plugin for smooth scrolling
Plug 'terryma/vim-smooth-scroll'

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

" send text to tmux
Plug 'christoomey/vim-tmux-runner'

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

if !has("win32")
  " ctag support for vim
  Plug 'xolox/vim-easytags'
  Plug 'xolox/vim-misc'
endif

" fold setup to work with various different languages
Plug 'pseewald/vim-anyfold'

" plugin for pulsing on searches
Plug 'inside/vim-search-pulse'

" rearrange python code to meet the pep8 standards
Plug 'tell-k/vim-autopep8', { 'for': 'python' }

" list currently open buffers and cycle through them with the directional keys
Plug 'jeetsukumaran/vim-buffergator'

" highlight copied chars
Plug 'machakann/vim-highlightedyank'

" python language agnostic tools (goto, completion, ...)
if !has("win32")
  Plug 'davidhalter/jedi-vim', { 'for': 'python' } 
endif

" do calculations inside of vim
Plug 'gregsexton/VimCalc'

" github colors (light)
Plug 'cormacrelf/vim-colors-github'

" xcode colors
Plug 'arzg/vim-colors-xcode'

" plugin for fancy start-up screen
Plug 'mhinz/vim-startify'

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

" Automatically switch on spell checking for some file types
autocmd FileType Markdown,markdown,latex,text setlocal spell

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

" Automaically rebalance windows on vim resize
autocmd VimResized * :wincmd =


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


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

" Keep cursor away from top/bottom
set scrolloff=5

" Enable autosave on vim startup
let g:auto_save = 1

" Do not save in insert mode
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
if has('nvim')
  set completeopt=longest,menuone
else
  set completeopt=longest,menuone,noselect
endif

" Activate mouse support
set mouse=a

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" activate clipboard on widows
if has('win32')
  set clipboard=unnamed
endif

" Use Silver Searcher instead of grep
if executable("ag")
  set grepprg=ag "\ --noheading\ --nogroup\ --nocolor
endif

" use improved substitute command in neovim
if has('nvim')
  set inccommand=nosplit
endif


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
colorscheme onedark

" Set nicer font in GUI
if !has('nvim') && has("gui_win32")
  "set guifont=Source\ Code\ Pro\ for\ Powerline:h10:cANSI
  set guifont=Consolas:h10:cANSI
  set lines=55 columns=88
elseif !has('nvim') && has("gui_macvim")
  "set guifont=MesloLGSNer-Regular:h11
  set guifont=Menlo:h11
endif

" Make it obvious where 80 characters is but do not hard break lines
set colorcolumn=81
set textwidth=0
set wrapmargin=0

" Apply a color column in light grey in the 81st and from 121st column on
"let &colorcolumn="81,".join(range(121,9999),",")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define dirs for undo, backup and swap
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
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
" => Terminal mode related
""""""""""""""""""""""""""""""
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif


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
map <silent> <leader>k :bd<CR>
map <silent> <leader>K :bd!<CR>

" Close all the buffers
nnoremap <leader>ba :1,1000 bd!<CR>

" Useful mappings for managing buffers
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bN :bp<CR>

" Close help files and quickfix panes on 'q' or Escape
autocmd FileType help nnoremap <buffer> <silent> q :bd<CR>
autocmd FileType qf nnoremap <buffer> <silent> q :bd<CR>

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Remember info about open buffers on close
"set viminfo^=%

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
inoremap ,, <Esc>

" Force saving files that require root permission
cnoremap w!! w !sudo tee > /dev/null %

" Map the underscore to un-highlight after searching
nnoremap <silent> _ :nohl<CR>

" Map Ctrl-P to open fuzzy finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <c-b> :CtrlPBuffer<CR>
let g:ctrlp_use_caching = 0

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

" mapping for easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" smotth scrolling related
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 5, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 5, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 5, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 5, 4)<CR>

" add plugin for search pulses
let g:vim_search_pulse_duration = 200

" ale settings for linting
let g:ale_sign_column_always = 1
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

" lightline settings
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

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

" settings for python and vim tmux runner
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1

" jedi settings
let g:jedi#show_call_signatures = 2
let g:jedi#force_py_version = 3

" deoplete and neosnippet settings
if has('nvim')
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
    "let g:python3_host_prog = 'C:\Users\desonnse\Data\PythonEnvs\my_env\Scripts\python.exe'
  endif
endif

"# completor settings
"if !has('nvim')
  "inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  "inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  "inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
"endif

" mucomplete settings
set completeopt+=menuone
set completeopt+=noselect
" set completeopt+=noinsert
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " Add only if Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1

" vim startify settings
let g:startify_custom_header =[]
let g:startify_disable_at_vimenter = 1

" highlight yanks
let g:highlightedyank_highlight_duration = 250


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


" statusline formatting
function! HasPaste()
        if &paste
            return 'PASTE MODE  '
        else
            return ''
        endif
endfunction


" Setup a Tig command that opens tig in a terminal
if has('nvim')
    function! s:tig()
        let s:callback = {}
        let current = expand('%')

        function! s:callback.on_exit(job_id, code, event)
            bw!
        endfunction

        below new
        call termopen('tig status', s:callback)
        startinsert
    endfunction

    command! Tig call s:tig()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gvim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Sandbox area for testing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
