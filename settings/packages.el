(require 'package)

;; set packages
(setq package-archives
      '(("elpa" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

;; list the packages you want
(setq package-list
      '(company elixir-mode flycheck helm helm-ls-git multiple-cursors ujelly-theme neotree diff-hl magit crux use-package avy ace-window ivy counsel swiper smartparens rainbow-delimiters aggressive-indent restclient markdown-mode))

;; activate all the packages
;; (package-initialize)

;; fetch the list of packages available
;; (unless package-archive-contents
;;   (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(setq package-selected-packages (symbol-value 'package-list))

;; setup chords
(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1))

;; setup ivy
(use-package ivy
      :ensure t
      :diminish ivy-mode
      :config
      (ivy-mode t))

;; setup smartparens
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (add-hook 'prog-mode-hook 'smartparens-mode))

;; setup rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; setup org-alert
(use-package org-alert
  :ensure t
  :config
  (org-alert-enable)
  (setq alert-default-style 'osx-notifier))

;; setup company
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)

;; setup aggresive indent
(use-package aggressive-indent
  :ensure t
  :config)

;; setup markdown mode
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; setup restclient
(use-package restclient
  :ensure t)

;; elscreen
(use-package elscreen
  :ensure t
  :config
  (elscreen-start))

;; enable diff-hl
(add-hook 'after-init-hook (lambda()
                             (global-company-mode)
                             (global-diff-hl-mode)
                             (my/custom-diff-hl-colors)))

;; setup go-mode
(setq gofmt-command "goimports")
(add-hook 'before-save-hook #'gofmt-before-save)


(provide 'packages)
