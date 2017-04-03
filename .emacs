;; === Proxy settings to make use of package archives==========================
...
;; ============================================================================


;; === Repository settings and packages =======================================

; list the packages you want
(setq package-list '(
					tabbar
					neotree
					linum-relative
					auto-complete
					git-gutter-fringe
					minimap
					highlight-indent-guides
					adaptive-wrap
					sublime-themes
					solarized-theme
                    auto-highlight-symbol
                    ;flycheck
                    magit
                    projectile
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
 '(package-selected-packages (quote (neotree tabbar))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ============================================================================


;; === Global settings ========================================================

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

	;; Auto pair brackets and others
	 	(electric-pair-mode 1)

	;; Use spaces instead of tabs
		(setq-default indent-tabs-mode nil)

    ;; Detect file changes and reload file
        (global-auto-revert-mode t)

    ;; Make emacs save backups at one place
        (setq backup-directory-alist `(("." . "~/.saves")))
        (setq backup-by-copying t)
        (setq delete-old-versions t
            kept-new-versions 6
            kept-old-versions 2
            version-control t)
;; ============================================================================


;; === Package settings =======================================================

    ;; Turn on evil-mode on start up
        ;(require 'evil)
        ;(evil-mode t)

    ;; Use fuzzy file search on start up
        ;(require 'helm-config)
        ;(helm-mode 1)

    ;; Turn on tabbar-mode on start up
        (require 'tabbar)
        (tabbar-mode t)

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

    ;; Use minimap
    	(require 'minimap)
		;(minimap-mode 1)

	;; Automatically indent wrapped lines accordingly
	 	(when (fboundp 'adaptive-wrap-prefix-mode)
            (defun my-activate-adaptive-wrap-prefix-mode ()
                "Toggle `visual-line-mode' and `adaptive-wrap-prefix-mode' simultaneously."
                (adaptive-wrap-prefix-mode (if visual-line-mode 1 -1)))
            (add-hook 'visual-line-mode-hook 'my-activate-adaptive-wrap-prefix-mode))

	;; Highlight indent guides
		(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
		(setq highlight-indent-guides-method 'character)

	;; Use colorscheme correct
  		(set-frame-parameter nil 'background-mode 'dark)
		(load-theme 'spolsky t)

	;; find aspell and hunspell automatically

    ;; Auto highlight words under cursor
        (auto-highlight-symbol-mode t)

    ;; use flycheck to check code against coding standards
        ;(global-flycheck-mode)
;; ============================================================================
