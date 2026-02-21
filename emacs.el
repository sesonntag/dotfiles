;;*****************************************************************************
;; Title: emacs
;; Description: emacs configuration file
;; Author: Sebastian Sonntag
;; Date: 2026-02-11
;; License: MIT
;;*****************************************************************************

;; --------------------------------------------------
;; Early Performance Optimizations
;; --------------------------------------------------

(setq gc-cons-threshold (* 50 1000 1000))
(setq read-process-output-max (* 1024 1024))
(setq inhibit-startup-screen t)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 2 1000 1000))))

;; --------------------------------------------------
;; Package Setup
;; --------------------------------------------------

(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-expand-minimally t)

;; --------------------------------------------------
;; Core UI (GUI + Terminal Safe)
;; --------------------------------------------------

(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame
              (when (display-graphic-p)
                (when (fboundp 'tool-bar-mode)
                  (tool-bar-mode -1))
                (when (fboundp 'scroll-bar-mode)
                  (scroll-bar-mode -1))))))

(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

(global-hl-line-mode 1)
(setq scroll-margin 5)
(setq ring-bell-function 'ignore)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(global-auto-revert-mode 1)
(setq select-enable-clipboard t)

;; Backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-default t)

;; Column indicator
(setq-default fill-column 80)
(global-display-fill-column-indicator-mode 1)

(set-language-environment "UTF-8")

;; --------------------------------------------------
;; Theme (OneDark)
;; --------------------------------------------------

(use-package doom-themes
  :init
  (load-theme 'doom-one t))

;; --------------------------------------------------
;; Evil (Vim Emulation)
;; --------------------------------------------------

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

;; --------------------------------------------------
;; Leader Key (Space)
;; --------------------------------------------------

(use-package general
  :after evil
  :config
  ;; Make SPC a prefix key in normal & visual state
  (general-override-mode)

  (general-create-definer my/leader
    :states '(normal visual motion)
    :keymaps 'override
    :prefix "SPC")

  ;; Define leader bindings
  (my/leader
    "w" '(save-buffer :which-key "Save")
    "q" '(kill-buffer :which-key "Kill buffer")
    "x" '(save-buffers-kill-terminal :which-key "Exit Emacs")
    "f" '(treemacs :which-key "File tree")
    "b" '(ivy-switch-buffer :which-key "Switch buffer")
    "g" '(magit-status :which-key "Magit")
    "u" '(undo-tree-visualize :which-key "Undo tree")
    "s" '(flyspell-mode :which-key "Spell toggle")))

(use-package which-key
  :init (which-key-mode))

;; --------------------------------------------------
;; Completion + Search (CtrlP Replacement)
;; --------------------------------------------------

(use-package ivy
  :init (ivy-mode 1)
  :custom
  (ivy-use-virtual-buffers t))

(use-package counsel
  :after ivy
  :bind (("C-p" . counsel-find-file)))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)))

;; --------------------------------------------------
;; File Tree
;; --------------------------------------------------

(use-package treemacs
  :defer t)

;; --------------------------------------------------
;; Git
;; --------------------------------------------------

(use-package magit
  :defer t)

(use-package git-gutter
  :init (global-git-gutter-mode +1))

;; --------------------------------------------------
;; Linting
;; --------------------------------------------------

(use-package flycheck
  :init (global-flycheck-mode))

;; --------------------------------------------------
;; Completion Engine
;; --------------------------------------------------

(use-package company
  :init (global-company-mode 1))

;; --------------------------------------------------
;; Snippets
;; --------------------------------------------------

(use-package yasnippet
  :init (yas-global-mode 1))

;; --------------------------------------------------
;; Undo Tree
;; --------------------------------------------------

(use-package undo-tree
  :init (global-undo-tree-mode))

;; --------------------------------------------------
;; Folding
;; --------------------------------------------------

(add-hook 'prog-mode-hook 'hs-minor-mode)

;; --------------------------------------------------
;; Whitespace Cleanup
;; --------------------------------------------------

(add-hook 'before-save-hook #'delete-trailing-whitespace)

;; --------------------------------------------------
;; Start Screen
;; --------------------------------------------------

(use-package dashboard
  :init
  (dashboard-setup-startup-hook))

;; --------------------------------------------------
;; Auto reload init.el
;; --------------------------------------------------

(defun my/reload-init-file ()
  (interactive)
  (load-file user-init-file)
  (message "Config reloaded."))

(add-hook 'after-save-hook
          (lambda ()
            (when (string-equal (file-truename user-init-file)
                                (file-truename buffer-file-name))
              (my/reload-init-file))))