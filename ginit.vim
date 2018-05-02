"*******************************************************************************
" Title: ginit.vim
" Description: vim configuration file
" Author: Sebastian Sonntag
" Date: 2018-05-02
" License:
"*******************************************************************************

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
endif

" Set nicer font in Windows GUI
if has ("gui_win32")
    set guifont=Consolas:h10.5:cANSI
endif

" Set bigger font (still Menlo but with different size) in OS X
if has ("gui_macvim")
    set guifont=Menlo:h11
endif
