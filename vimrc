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

" Performance tuning
set hidden                    " Allow switching buffers without saving
set updatetime=300            " Faster git/LSP updates
set timeoutlen=500            " Faster mapped key timeout
set lazyredraw                " Improve macro performance
set ttyfast                   " Faster terminal redraw

" ------------------------------------------------------------
" 2. Plugin Management (vim-plug)
" ------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'joshdick/onedark.vim'

" File navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'

" Statusline
Plug 'itchyny/lightline.vim'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Native Vim 8 LSP
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
" 3. Colorscheme Configuration
" ------------------------------------------------------------

if has("termguicolors")
  set termguicolors
endif

let g:onedark_style = 'darker'          " dark | darker | cool | deep | warm
let g:onedark_terminal_italics = 1
let g:onedark_hide_endofbuffer = 1

colorscheme onedark

" ------------------------------------------------------------
" 4. UI Settings
" ------------------------------------------------------------

set number
set relativenumber
set cursorline
set scrolloff=5
set splitbelow
set splitright
set signcolumn=yes
set colorcolumn=81
set showcmd
set ruler
set laststatus=2

set nowrap
set breakindent

" ------------------------------------------------------------
" 5. Editing Behavior
" ------------------------------------------------------------

set expandtab
set smartindent
set shiftround
set tabstop=4
set shiftwidth=4

augroup Indentation
  autocmd!
  autocmd FileType python setlocal tabstop=4 shiftwidth=4
  autocmd FileType c,cpp,html,xml,markdown,latex,ruby,vim setlocal tabstop=2 shiftwidth=2
augroup END

" ------------------------------------------------------------
" 6. Search Behavior
" ------------------------------------------------------------

set ignorecase
set smartcase
set incsearch
set hlsearch

" ------------------------------------------------------------
" 7. Clipboard
" ------------------------------------------------------------

if has('unnamedplus')
  set clipboard=unnamedplus
endif

" ------------------------------------------------------------
" 8. Backup / Swap / Persistent Undo
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
" 9. Plugin Configuration
" ------------------------------------------------------------

" ----- Lightline -----
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

" ----- LSP -----
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

nnoremap <leader>gd :LspDefinition<CR>
nnoremap <leader>gr :LspReferences<CR>
nnoremap <leader>rn :LspRename<CR>
nnoremap <leader>ca :LspCodeAction<CR>

" ----- ALE -----
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" ------------------------------------------------------------
" 10. Autocommands
" ------------------------------------------------------------

augroup Core
  autocmd!

  " Remove trailing whitespace on save
  autocmd BufWritePre * %s/\s\+$//e

  " Restore last cursor position
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute "normal! g`\"" |
        \ endif
augroup END

" ------------------------------------------------------------
" 11. Keymaps
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
