;;*****************************************************************************
;; Title: emacs
;; Description: emacs configuration file
;; Author: Sebastian Sonntag
;; Date: 2019-03-23
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
    (setq default-directory "D:/desonnse/"))

;; scroll three lines with mouse, and one line with keyboard
  (setq mouse-wheel-scroll-amount '(3 ((shift) . 1)))
  (setq mouse-wheel-progressive-speed nil)
  (setq mouse-wheel-follow-mouse 't)
  (setq scroll-step 1)

;; no alarm bell
  (setq ring-bell-function 'ignore)

;; remove trailing white spaces
  (add-hook 'before-save-hook 'delete-trailing-whitespace)

;; always use y-or-n as answer
  (defalias 'yes-or-no-p 'y-or-n-p)

;; show matching brackets
  (show-paren-mode 1)

;; auto pair brackets and others
  (electric-pair-mode 1)

;; deactivate splash and startup stuff
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; use spaces instead of tabs
  (setq-default indent-tabs-mode nil)

;; detect file changes and reload file
  (global-auto-revert-mode t)

;; Put backup files neatly away
  (let ((backup-dir "~/.emacs.d/backups")
    (auto-saves-dir "~/.emacs.d/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
    auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
    auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
    tramp-backup-directory-alist `((".*" . ,backup-dir))
    tramp-auto-save-directory auto-saves-dir))

  (setq backup-by-copying t    ; Don't delink hardlinks
    delete-old-versions t  ; Clean up the backups
    version-control t      ; Use version numbers on backups,
    kept-new-versions 5    ; keep some new versions
    kept-old-versions 2)   ; and some old ones, too

;; comment or un-comment the current line or selection
  (global-set-key (kbd "C-,") 'comment-line)

;; highlight current line (Setting)
  (global-hl-line-mode 1)
  (set-face-foreground 'highlight nil)


;; === Key bindings ===========================================================
  ;; Windows movement
    (global-set-key (kbd "C-x <up>") 'windmove-up)
    (global-set-key (kbd "C-x <down>") 'windmove-down)
    (global-set-key (kbd "C-x <left>") 'windmove-left)
    (global-set-key (kbd "C-x <right>") 'windmove-right)


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
  (use-package evil
    :ensure t
    :config
    (evil-mode 1)

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  (use-package evil-indent-textobject
    :ensure t))

  (dolist (mode '(magit-mode
                  flycheck-error-list-mode
                  git-rebase-mode))
    (add-to-list 'evil-emacs-state-modes mode))

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key "w" 'save-buffer))


;; === neotree settings =======================================================
  (use-package neotree
    :ensure t
    :config
    (setq neo-smart-open t))


;; === relative line number settings ===========================================
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


;; === highlight multiple occurrences =========================================
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
  :ensure t)


;; === trim trailing white spaces =============================================
  (use-package whitespace-cleanup-mode
    :ensure t
    :config
    (global-whitespace-cleanup-mode t))


;; === spellchecking ==========================================================
  (use-package flyspell
    :ensure t
    :config
    (setq ispell-program-name "/usr/local/bin/ispell")
    (add-hook 'text-mode-hook 'flyspell-mode)
    (add-hook 'prog-mode-hook 'flyspell-prog-mode))


;; === auto completion ========================================================
  (use-package company
    :ensure t
    :config
    (add-hook 'after-init-hook 'global-company-mode)
    (setq company-minimum-prefix-length 1)
    (setq company-selection-wrap-around t)
    (company-tng-configure-default))


;; === ido ====================================================================
  (use-package ido
    :ensure t
    :config
    (ido-mode t))






;; ============================================================================
;; === OLD STUFF - NOT YET DONE ===============================================
;; ============================================================================
;; list the packages you want
;(setq package-list '(tabbar
;                     flycheck
;                     projectile
;                     helm
;                     yasnippet
;                     bind-key
; ))
;
;    ;; use flycheck to check code against coding standards
;        (require 'flycheck)
;        (global-flycheck-mode)
;
;    ;; use yasnippet
;        (require 'yasnippet)
;        (yas-global-mode 1)


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
