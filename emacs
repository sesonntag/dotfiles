;; === Proxy settings to make use of package archives==========================

; ..
;; ============================================================================


;; === Repository settings and packages =======================================

; list the packages you want
(setq package-list '(tabbar
                                neotree
                                linum-relative
                                auto-complete
                                git-gutter-fringe
                                minimap
                                highlight-indent-guides
                                adaptive-wrap
                                auto-highlight-symbol
                                flycheck
                                magit
                                projectile
                                helm
                                undo-tree
                                yasnippet
                                bind-key
                                rainbow-delimiters
                                molokai-theme
 ))

; list the repositories containing them
(setq package-archives '(;("elpa" . "http://tromey.com/elpa/")
                        ("melpa" . "https://melpa.org/packages/")
                        ("gnu" . "http://elpa.gnu.org/packages/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (helm neotree tabbar))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ============================================================================


;; === Global settings ========================================================

    ;; set default dir for emacs
        ;(setq default-directory "C:/Documents and Settings/USER_NAME/Desktop/")

	;; scroll three lines with mouse, and one line with keyboard
		(setq mouse-wheel-scroll-amount '(3 ((shift) . 1)))
		(setq mouse-wheel-progressive-speed nil)
		(setq mouse-wheel-follow-mouse 't)
		(setq scroll-step 1)

	;; no alarm bell
		(setq ring-bell-function 'ignore)

	;; Remove trailing white spaces
		(add-hook 'before-save-hook 'delete-trailing-whitespace)

	;; Reopen closed files on start up
		(desktop-save-mode 1)

	;; Always use y-or-n as answer
	 	(defalias 'yes-or-no-p 'y-or-n-p)

	;; Show matching parens
		(show-paren-mode 1)

    ;; Show pairs in colors
        (require 'rainbow-delimiters)
        ;(rainbow-delimiters-mode t)

	;; Auto pair brackets and others
	 	(electric-pair-mode 1)

	;; Use spaces instead of tabs
		(setq-default indent-tabs-mode nil)

    ;; Detect file changes and reload file
        (global-auto-revert-mode t)

    ;; Make emacs save backups at one place
        (setq backup-directory-alist `(("." . "~/.emacs_saves")))
        (setq backup-by-copying t)
        (setq delete-old-versions t
            kept-new-versions 6
            kept-old-versions 2
            version-control t)
;; ============================================================================


;; === Package settings =======================================================

    ;; Turn on neotree on start up
        (require 'neotree)
        ;(neotree t)

    ;; Turn on relative line numbers plus actual line number on current line
    	(require 'linum-relative)
		(linum-relative-global-mode)
    	(setq linum-relative-current-symbol "")

    ;; Default config for auto completion
    	(ac-config-default)

    ;; Use git gutter
    	(require 'git-gutter-fringe)
    	(global-git-gutter-mode +1)
        (set-face-foreground 'git-gutter-fr:modified "yellow")
        (set-face-foreground 'git-gutter-fr:added    "green")
        (set-face-foreground 'git-gutter-fr:deleted  "red")

    ;; Use minimap
    	(require 'minimap)
		;(minimap-mode 1)

	;; Highlight indent guides
		;(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
		;(setq highlight-indent-guides-method 'character)

	;; Use colorscheme correct
  		(set-frame-parameter nil 'background-mode 'dark)
		(load-theme 'molokai t)

    ;; Auto highlight words under cursor
        (auto-highlight-symbol-mode t)

    ;; Use undo-tree to show history of changes
        (global-undo-tree-mode t)

    ;; use flycheck to check code against coding standards
        (require 'flycheck)
        (global-flycheck-mode)

    ;; use yasnippet
        (require 'yasnippet)
        (yas-global-mode 1)

    ;; wrap words
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
        (adaptive-wrap-mode)
;; ============================================================================


;; === Key bindings =========================================================;;

    ;; Windows movement
        (global-set-key (kbd "C-x <up>") 'windmove-up)
        (global-set-key (kbd "C-x <down>") 'windmove-down)
        (global-set-key (kbd "C-x <left>") 'windmove-left)
        (global-set-key (kbd "C-x <right>") 'windmove-right)

    ;; Comment or uncomment
        (global-set-key (kbd "C-,") 'comment-line)

    ;; Check magit status
        (global-set-key (kbd "C-x g") 'magit-status)
;; ============================================================================


;; === ToDo =================================================================;;

	;; find aspell and hunspell automatically
        ;(setq flyspell-issue-welcome-flag nil)
        ;(if (eq system-type 'darwin)
        ;(setq-default ispell-program-name "/usr/local/bin/aspell")
        ;(setq-default ispell-program-name "/usr/bin/aspell"))
        ;(setq-default ispell-list-command "list")

        ;; Use fuzzy file search on start up ;
        ;(add-to-list 'load-path "~/.emacs.d/helm")
        ;(require 'helm-config)
        ;(with-eval-after-load "helm.el"
           ;(define-key helm-map (kbd "<tab>") 'helm-execute-persistant-action)
            ;(global-set-key (kbd "C-x b") helm-buffers-list)
            ;(global-set-key (kbd "C-x r b") helm-bookmarks)
            ;(global-set-key (kbd "M-y") helm-M-x)
            ;(global-set-key (kbd "M-y") helm-show-kill-ring)
            ;(global-set-key (kbd "C-x C-f") helm-find-files))
        ;(helm-mode 1)
;; ============================================================================


;; === Unused packages/settings =============================================;;

	;; highlight current line (Setting)
	    ;(global-hl-line-mode 1)
	    ;(set-face-foreground 'highlight nil)

    ;; Turn on evil-mode on start up (package)
        ;(require 'evil)
        ;(evil-mode t)

    ;; Turn on tabbar-mode on start up (package)
        (require 'tabbar)
        ;(tabbar-mode t)
