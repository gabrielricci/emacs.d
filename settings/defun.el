;; clipboard
(defun pbcopy ()
  (interactive)
  (let ((deactivate-mark t))
    (call-process-region (point) (mark) "pbcopy")))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))

;; function to maximize a buffer
(defun toggle-maximize-buffer () "Maximize buffer"
       (interactive)
       (if (= 1 (length (window-list)))
	   (jump-to-register '_)
	 (progn
	   (set-register '_ (list (current-window-configuration)))
	   (delete-other-windows))))

;; function to split screens evenly
(defun my/split-window-horizon-evenly ()
  (interactive)
  (split-window-right)
  (other-window 1)
  (balance-windows))

(defun my/split-window-verti-evenly ()
  (interactive)
  (split-window-below)
  (other-window)
  (balance-windows))

(defun my/close-window-evenly ()
  (interactive)
  (delete-window)
  (balance-windows))

;; open a shell in a new window
(defun my/new-shell-in-new-window ()
  (interactive)
  (split-window-horizontally)
  (next-multiframe-window)
  (ansi-term (getenv "SHELL")))

;; open a shell in a new window
(defun my/new-shell-same-window ()
  (interactive)
  (ansi-term (getenv "SHELL")))

;; line handling
(defun my/insert-line-above ()
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (previous-line)
  (indent-according-to-mode))

(defun my/insert-line-below ()
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

;; find out font face under cursor
(defun my/what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (pos) 'read-face-name)
                  (get-char-property (pos) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas-minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

(defun my/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(provide 'defun)
