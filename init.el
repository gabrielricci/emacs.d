(package-initialize)
;; Turn off mouse interface early in startup to avoid momentary display
;; From https://github.com/magnars/.emacs.d
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-message t)

;; Set path to dependencies
(setq site-lisp-dir (expand-file-name "site-lisp" user-emacs-directory))
(setq settings-dir (expand-file-name "settings" user-emacs-directory))
(setq bin-dir (expand-file-name "bin" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)

;; load packages
(require 'packages)
(package-initialize)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; load up settings files
(require 'appearance)
(require 'defun)
(require 'layout)
(require 'bindings)
(require 'erlang)
(require 'todos)

;; always split windows vertically
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; disable backups
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;; enable line numbers
(global-linum-mode t)

;; make yes or no prompt easier
(defalias 'yes-or-no-p 'y-or-n-p)

;; disable tabs
(setq-default indent-tabs-mode nil)

;; delete trailing whitespaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; UTF-8 as default encoding
(set-language-environment "UTF-8")

;; integrate magit with diff-hl
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
