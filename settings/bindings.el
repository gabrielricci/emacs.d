;; make sure S-arrows work
(define-key input-decode-map "\e[1;2A" [S-up])
(define-key input-decode-map "\e[1;2B" [S-down])
(define-key input-decode-map "\e[1;2C" [S-right])
(define-key input-decode-map "\e[1;2D" [S-left])

;; enable helm to search for files
(global-set-key (kbd "C-x p") 'helm-browse-project)

;; keybindings for multiple-cursors
(global-set-key (kbd "M-9") 'mc/mark-next-like-this-word)
(global-set-key (kbd "M-8") 'mc/mark-previous-like-this-symbol)
(global-set-key (kbd "M-1") 'mc/unmark-next-like-this)
(global-set-key (kbd "M-2") 'mc/skip-to-next-like-this)
(global-set-key (kbd "M-0") 'mc/edit-beginnings-of-lines)

;; bind to make a buffer full screen
(global-set-key (kbd "M-RET") 'toggle-maximize-buffer)

;; window management
(global-set-key (kbd "C-c h") 'my/split-window-horizon-evenly)
(global-set-key (kbd "C-c v") 'my/split-window-verti-evenly)
(global-set-key (kbd "C-c k") 'my/close-window-evenly)
(key-chord-define-global "wp" 'my/split-window-horizon-evenly)
(key-chord-define-global "wd" 'delete-window)
(key-chord-define-global "vv" 'elscreen-next)

;; open a shell in a new window
(global-set-key (kbd "C-c s") 'my/new-shell-in-new-window)
(key-chord-define-global "ws" 'my/new-shell-in-new-window)

;; open neotree
(global-set-key (kbd "C-\\") 'neotree-toggle)

;; line insertions
(global-set-key (kbd "C-o") 'my/insert-line-below)
(global-set-key (kbd "M-o") 'my/insert-line-above)

;; crux bindings
(global-set-key [remap move-beginning-of-line] 'crux-move-beginning-of-line)
(global-set-key [(shift return)] 'crux-smart-open-line)
(global-set-key (kbd "C-<backspace>")'crux-kill-line-backwards)
(global-set-key (kbd "C-c i") 'crux-find-user-init-file)
(global-set-key (kbd "C-c d") 'crux-duplicate-current-line-or-region)
(global-set-key (kbd "C-c n") 'crux-cleanup-buffer-or-region)
(global-set-key (kbd "C-c e") 'crux-eval-and-replace)
(global-set-key (kbd "M-k") 'crux-kill-whole-line)
(global-set-key (kbd "C-k") 'crux-smart-kill-line)
(global-set-key (kbd "C-j") 'crux-top-join-line)
(global-set-key (kbd "C-c u") 'crux-view-url)
(key-chord-define-global "kk" 'crux-kill-whole-line)

;; go to line
(global-set-key (kbd "C-c l") 'goto-line)

;; eval buffer
(global-set-key (kbd "C-x C-e") 'eval-buffer)

;; setup avy
(use-package avy
  :ensure t
  :chords (("jh" . avy-goto-char-timer)
           ("jk" . avy-goto-line)))

;; counsel
(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x))
  :chords (("yy" . counsel-yank-pop)))

;; setup swiper
(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)))

;; setup ace-window
(use-package ace-window
  :ensure t
  :chords (("ww" . ace-window))
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;; setup dumup-jump
(use-package dumb-jump
  :ensure t
  :chords (("88" . dumb-jump-go)
           ("jj" . dumb-jump-go)
           ("99" . dumb-jump-go-other-window)
           ("jw" . dumb-jump-go-other-window)
           ("bb" . dumb-jump-back)
           ("77" . dumb-jump-back))
  :config
  (setq dumb-jump-quiet t))

(global-set-key [backtab] 'tab-indent-or-complete)

(provide 'bindings)
