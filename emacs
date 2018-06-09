;;*****************************************************************************
;; Title: emacs
;; Description: emacs configuration file
;; Author: Sebastian Sonntag
;; Date: 2018-06-08
;; License:
;;*****************************************************************************


;; === save custom settings in separate file ==================================
  (setq custom-file "~/.emacs-custom.el")
  (load custom-file)


;; === repo settings ==========================================================
  (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                           ("marmalade" . "https://marmalade-repo.org/packages/")
                           ("melpa" . "https://melpa.org/packages/")))


;; === package manager settings ===============================================
  (package-initialize)
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

  (eval-when-compile
    (require 'use-package))


;; === global settings ========================================================
;; set default dir for emacs
  (if (eq system-type 'darwin)
    (setq default-directory "~/"))

  (if (eq system-type 'windows-nt)
    (setq default-directory "C:/Users/desonnse/"))

;; scroll three lines with mouse, and one line with keyboard
  (setq mouse-wheel-scroll-amount '(3 ((shift) . 1)))
  (setq mouse-wheel-progressive-speed nil)
  (setq mouse-wheel-follow-mouse 't)
  (setq scroll-step 1)

;; no alarm bell
  (setq ring-bell-function 'ignore)

;; remove trailing white spaces
  (add-hook 'before-save-hook 'delete-trailing-whitespace)

;; reopen closed files on start up
  ;(desktop-save-mode 1)

;; always use y-or-n as answer
  (defalias 'yes-or-no-p 'y-or-n-p)

;; show matching parens
  (show-paren-mode 1)

;; auto pair brackets and others
  (electric-pair-mode 1)

;; use spaces instead of tabs
  (setq-default indent-tabs-mode nil)

;; detect file changes and reload file
  (global-auto-revert-mode t)

;; make emacs save backups at one place
  (setq backup-directory-alist `(("." . "~/.emacs_saves")))
  (setq backup-by-copying t)
  (setq delete-old-versions t
    kept-new-versions 6
    kept-old-versions 2
    version-control t)

;; comment or uncomment the current line or selection
  (global-set-key (kbd "C-,") 'comment-line)

;; highlight current line (Setting)
  (global-hl-line-mode 1)
  (set-face-foreground 'highlight nil)


;; === color settings =========================================================
  ; set background color
    (set-frame-parameter nil 'background-mode 'dark)

  ; color theme
    (use-package atom-one-dark-theme
      :ensure t
      :config
      (load-theme 'atom-one-dark t))


;; === git gutter =============================================================
  (use-package git-gutter-fringe
    :ensure t
    :config
    (global-git-gutter-mode +1)
    (set-face-foreground 'git-gutter-fr:modified "yellow")
    (set-face-foreground 'git-gutter-fr:added    "green")
    (set-face-foreground 'git-gutter-fr:deleted  "red"))


;; === evil settings ==========================================================
;  (use-package evil
;    :ensure t
;    :config
;    (evil-mode 1)
;
;    (use-package evil-leader
;      :ensure t
;      :config
;      (global-evil-leader-mode))
;         (evil-leader/set-leader "<SPC>")
;         (evil-leader/set-key
;           "w" 'save-buffer)
;         ; "C-n" 'neotree-toggle) ;open question: how to use ctrl?
;
;    (use-package evil-surround
;      :ensure t
;      :config
;      (global-evil-surround-mode 1))


;; === neotree settings =======================================================
  (use-package neotree
    :ensure t)

;; === relative line numer settings ===========================================
  (use-package linum-relative
    :ensure t
    :config
    (linum-relative-global-mode)
    (setq linum-relative-current-symbol ""))


;; === indent guides ==========================================================
  (use-package highlight-indent-guides
    :ensure t
    :config
    (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
    (setq highlight-indent-guides-method 'character))


;; === word wrapping ==========================================================
  (use-package adaptive-wrap
    :ensure t
    :config
    (defun turn-on-adaptive-wrap-prefix-mode (&optional arg)
      (interactive)
      (adaptive-wrap-prefix-mode (or arg 1)))
    (defun turn-off-adaptive-wrap-prefix-mode (&optional arg)
      (interactive)
      (adaptive-wrap-prefix-mode (or arg -1)))
    (defun adaptive-wrap-initialize ()
      (unless (minibufferp)
        (progn
          (adaptive-wrap-prefix-mode 1)
          (setq word-wrap t))))
    (define-globalized-minor-mode adaptive-wrap-mode
      adaptive-wrap-prefix-mode adaptive-wrap-initialize)
    (adaptive-wrap-mode))


;; === highlight multiple occurances ==========================================
  (use-package highlight-symbol
    :ensure t
    :config
    (highlight-symbol-mode t)
    (global-set-key (kbd "C-x C-h") 'highlight-symbol))


;; === undo tree ==============================================================
  (use-package undo-tree
    :ensure t
    :config
    (global-undo-tree-mode t))


;; === magit ==================================================================
  (use-package magit
    :ensure t
    :config
    (global-set-key (kbd "C-x g") 'magit-status))


;; === markdown support =======================================================
  (use-package markdown-mode
  :ensure t
  :config)


;; === trim trailing whitespaces ==============================================
  (use-package whitespace-cleanup-mode
    :ensure t
    :config
    (global-whitespace-cleanup-mode t))


;; === commenting =============================================================
  (use-package smart-comment
    :ensure t
    :bind
    ("M-;" . smart-comment))








;; ============================================================================
;; === OLD STUFF - NOT YET DONE ===============================================
;; ============================================================================
;; list the packages you want
;(setq package-list '(tabbar
;                     auto-complete
;                     flycheck
;                     projectile
;                     helm
;                     yasnippet
;                     bind-key
; ))
;
;    ;; Default config for auto completion
;        (ac-config-default)
;
;    ;; use flycheck to check code against coding standards
;        (require 'flycheck)
;        (global-flycheck-mode)
;
;    ;; use yasnippet
;        (require 'yasnippet)
;        (yas-global-mode 1)

;;; === Key bindings =========================================================;;
;    ;; Windows movement
;        (global-set-key (kbd "C-x <up>") 'windmove-up)
;        (global-set-key (kbd "C-x <down>") 'windmove-down)
;        (global-set-key (kbd "C-x <left>") 'windmove-left)
;        (global-set-key (kbd "C-x <right>") 'windmove-right)


;; === ToDo =================================================================;;
;    ;; find aspell and hunspell automatically
;        ;(setq flyspell-issue-welcome-flag nil)
;        ;(if (eq system-type 'darwin)
;        ;(setq-default ispell-program-name "/usr/local/bin/aspell")
;        ;(setq-default ispell-program-name "/usr/bin/aspell"))
;        ;(setq-default ispell-list-command "list")
;
;        ;; Use fuzzy file search on start up ;
;        ;(add-to-list 'load-path "~/.emacs.d/helm")
;        ;(require 'helm-config)
;        ;(with-eval-after-load "helm.el"
;           ;(define-key helm-map (kbd "<tab>") 'helm-execute-persistant-action)
;            ;(global-set-key (kbd "C-x b") helm-buffers-list)
;            ;(global-set-key (kbd "C-x r b") helm-bookmarks)
;            ;(global-set-key (kbd "M-y") helm-M-x)
;            ;(global-set-key (kbd "M-y") helm-show-kill-ring)
;            ;(global-set-key (kbd "C-x C-f") helm-find-files))
;        ;(helm-mode 1)

;; === vim packages ===========================================================
;Plug 'kien/ctrlp.vim', { 'on':  'CtrlP' } --> fuzzy file search
;Plug 'vim-airline/vim-airline' --> adding airline engine and themes
;Plug 'vim-airline/vim-airline-themes' --> adding airline engine and themes
;Plug 'Shougo/deoplete.nvim' --> completions
;Plug 'tpope/vim-surround' --> add surroundings with vim style commands
;Plug 'Shougo/vinarise.vim', { 'for': 'hex' } --> hex features vor neovim
;Plug 'junegunn/gv.vim' --> show detailed information about git repos
;Plug 'auwsmit/vim-active-numbers' --> show line numbers only in current window
;Plug 'christoomey/vim-tmux-navigator' --> navigate in vim and tmux without further actions
;Plug 'w0rp/ale' --> asynchronous linting engine
;Plug 'google/vim-searchindex' --> add indexing to search results
;Plug 'lervag/vimtex', { 'for': 'latex' } --> adding latex features to neovim
;Plug 'vim-scripts/SearchComplete' --> tab completion on search
;Plug 'jvirtanen/vim-octave', { 'for': ['octave', 'matlab'] } --> octave/matlab syntax highlighting
;Plug 'sickill/vim-pasta' --> indent araw pasting to not clutter the indentation depth
;Plug 'brooth/far.vim' --> search and replace across multiple files
;Plug 'janko-m/vim-test' --> running code tests (e.g. pytest, rspec, ...)
;Plug 'aserebryakov/vim-todo-lists' --> managing to-do lists
;Plug 'majutsushi/tagbar' --> display tags in the right side
;Plug 'ludovicchabant/vim-gutentags' --> ctag support for neovim
;Plug 'pseewald/vim-anyfold' --> fold setup to work with various different languages
;Plug 'tell-k/vim-autopep8', { 'for': 'python' } --> rearrange python code to meet the pep8 standards
;Plug 'jeetsukumaran/vim-buffergator' --> list currently open buffers and cycle through them with the directional keys
;Plug 'davidhalter/jedi-vim', { 'for': 'python' } --> python language agnostic tools (goto, completion, ...)