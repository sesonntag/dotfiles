"*******************************************************************************
" Title: vimrc
" Description: vim configuration file
" Author: Sebastian Sonntag
" Date: 2026-02-20
" License: MIT
"*******************************************************************************

" ------------------------------------------------------------
" 1. Core / Bootstrap
" ------------------------------------------------------------

set nocompatible              " Disable Vi compatibility
filetype off                  " Required before plugin loading

let mapleader = " "           " Use space as leader key

" Improve startup performance
set hidden                    " Allow switching buffers without saving
set updatetime=300            " Faster completion & git updates
set timeoutlen=500            " Faster mapped sequence timeout
set lazyredraw                " Do not redraw during macros
set ttyfast                   " Faster terminal redraw

" ------------------------------------------------------------
" 2. Plugin Management (vim-plug)
" ------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" File navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'

" Status line
Plug 'itchyny/lightline.vim'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" LSP (native Vim async support)
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" Linting
Plug 'dense-analysis/ale'

" Comment toggling
Plug 'tpope/vim-commentary'

call plug#end()

filetype plugin indent on
syntax enable

" ------------------------------------------------------------
" 3. General Settings
" ------------------------------------------------------------

set encoding=utf-8
set fileencoding=utf-8

set number                    " Show absolute line numbers
set relativenumber            " Show relative line numbers
set cursorline                " Highlight current line
set scrolloff=5               " Keep context above/below cursor
set splitbelow                " Horizontal splits open below
set splitright                " Vertical splits open right
set signcolumn=yes            " Always show sign column
set colorcolumn=81            " Visual column marker
set showcmd                   " Show partial command
set ruler                     " Show cursor position
set laststatus=2              " Always show statusline

if has("termguicolors")
  set termguicolors           " Enable 24-bit colors if supported
endif

" ------------------------------------------------------------
" 4. Editing Behavior
" ------------------------------------------------------------

set expandtab                 " Use spaces instead of tabs
set smartindent               " Smarter auto indentation
set shiftround                " Round indent to multiple of shiftwidth
set tabstop=4
set shiftwidth=4

" Language-specific indentation
augroup Indentation
  autocmd!
  autocmd FileType python setlocal tabstop=4 shiftwidth=4
  autocmd FileType c,cpp,html,xml,markdown,latex,ruby,vim setlocal tabstop=2 shiftwidth=2
augroup END

set nowrap                    " Disable line wrapping
set breakindent               " Wrapped lines maintain indentation

" ------------------------------------------------------------
" 5. Search Behavior
" ------------------------------------------------------------

set ignorecase                " Case-insensitive search...
set smartcase                 " ...unless uppercase is used
set incsearch                 " Show matches while typing
set hlsearch                  " Highlight search matches

" ------------------------------------------------------------
" 6. Clipboard
" ------------------------------------------------------------

if has('unnamedplus')
  set clipboard=unnamedplus   " Use system clipboard
endif

" ------------------------------------------------------------
" 7. Backup, Swap & Persistent Undo
" ------------------------------------------------------------

set backup
set writebackup

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

if has("persistent_undo")
  set undofile
  set undodir=~/.vim/undo//
endif

" ------------------------------------------------------------
" 8. Plugin Configuration
" ------------------------------------------------------------

" ----- Lightline -----
let g:lightline = {
      \ 'colorscheme': 'default'
      \ }

" ----- LSP -----
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

" LSP key bindings
nnoremap <leader>gd :LspDefinition<CR>
nnoremap <leader>gr :LspReferences<CR>
nnoremap <leader>rn :LspRename<CR>
nnoremap <leader>ca :LspCodeAction<CR>

" ----- ALE -----
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" ------------------------------------------------------------
" 9. Autocommands
" ------------------------------------------------------------

augroup Core
  autocmd!
  " Remove trailing whitespace on save
  autocmd BufWritePre * %s/\s\+$//e

  " Restore cursor position when reopening file
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute "normal! g`\"" |
        \ endif
augroup END

" ------------------------------------------------------------
" 10. Keymaps
" ------------------------------------------------------------

" Basic
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" File navigation
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>

" Search
nnoremap <leader>/ :nohlsearch<CR>

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" Quick escape from insert mode
inoremap kj <Esc>

" ============================================================
"  End of Configuration
" ============================================================
