;; custom functions
(defun my/custom-diff-colors ()
  "update the colors for diff faces"
  (set-face-attribute
   'diff-added nil :foreground "#7ccd7c" :background "black")
  (set-face-attribute
   'diff-removed nil :foreground "#ee6363" :background "black")
  (set-face-attribute
   'diff-changed nil :foreground "#3a81c3" :background "black")
  (set-face-attribute
   'diff-file-header  nil :foreground "white" :background "black")
  (set-face-attribute
   'diff-header  nil :foreground "white" :background "black")
  (set-face-attribute
   'diff-hunk-header  nil :foreground "orange" :background "black"))

(defun my/custom-diff-hl-colors()
  "define the colors for diff-hl margin markers"
  (custom-set-faces
   '(diff-hl-change ((t (:background "#3a81c3"))))
   '(diff-hl-insert ((t (:background "#7ccd7c"))))
   '(diff-hl-delete ((t (:background "#ee6363")))))
  (diff-hl-margin-mode)
  (diff-hl-flydiff-mode))

;; default theme
(load-theme 'ujelly)

;; don't beep. Don't visible-bell (fails on el capitan). Just blink the modeline on errors.
(setq visible-bell nil)
(setq ring-bell-function (lambda ()
			   (invert-face 'mode-line)
			   (run-with-timer 0.05 nil 'invert-face 'mode-line)))

;; highlight current line
(global-hl-line-mode 1)

;; customizing colors used in diff mode
(eval-after-load "diff-mode" '(my/custom-diff-colors))

;; customize shell
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; some general display settings (helm, linum, windows, etc)
(custom-set-variables
 '(global-linum-mode t)
 '(helm-always-two-windows t)
 '(helm-boring-buffer-regexp-list
   '("\\` " "\\`\\*helm" "\\`\\*Echo Area" "\\`\\*Minibuf" ".*"))
 '(helm-split-window-default-side 'below)
 '(helm-split-window-inside-p nil)
 '(linum-format "%3d  ")
 '(org-priority-faces '((65 . "DeepPink") (66 . "firebrick") (67 . "tomato")) t)
 '(org-scheduled-today ((t (:foreground "white"))))
 '(split-width-threshold 1)
 '(window-combination-resize t))

;; custom colors for the ujelly theme
(custom-set-faces
 '(col-highlight ((t (:background "color-233"))))
 '(diff-hl-change ((t (:background "#3a81c3"))))
 '(diff-hl-delete ((t (:background "#ee6363"))))
 '(diff-hl-insert ((t (:background "#7ccd7c"))))
 '(erlang-font-lock-exported-function-name-face ((t (:inherit font-lock-function-name-face :foreground "#ffffff"))))
 '(flycheck-error ((t (:background "brown4" :foreground "white"))))
 '(flycheck-warning ((t (:background "gray20"))))
 '(font-lock-constant-face ((t (:foreground "#8fbfdc"))))
 '(font-lock-function-name-face ((t (:foreground "#ffffff"))))
 '(font-lock-preprocessor-face ((t (:foreground "#6290D1"))))
 '(font-lock-string-face ((t (:foreground "#9dab71"))))
 '(font-lock-type-face ((t (:foreground "#98BED3"))))
 '(font-lock-variable-name-face ((t (:foreground "#c2b5e5"))))
 '(hl-line ((t (:background "gray10"))))
 '(lazy-highlight ((t (:background "black" :foreground "white" :underline t))))
 '(neo-dir-link-face ((t (:foreground "#3a81c3"))))
 '(neo-file-link-face ((t (:foreground "white"))))
 '(org-agenda-done ((t (:foreground "lightcyan"))))
 '(org-agenda-structure ((t (:foreground "#3a81c3"))))
 '(org-scheduled ((t (:foreground "brightwhite"))))
 '(org-scheduled-today ((t (:foreground "cornsilk"))))
 '(widget-field ((t (:background "gray15" :foreground "brightwhite")))))

(custom-set-faces
 '(elscreen-tab-background-face ((t (:background "Gray50"))))
 '(elscreen-tab-other-screen-face ((t (:background "Gray85" :foreground "Gray50" :box (:line-width 1 :style released-button)))))
 '(elscreen-tab-current-screen-face ((t (:background "Gray95" :foreground "black" :box (:line-width 1 :style released-button))))))

(provide 'appearance)
