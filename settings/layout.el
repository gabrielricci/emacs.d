;; layout definition
(defun my/startup-layout ()
 (interactive)
 (delete-other-windows)
 (split-window-horizontally)
)

;; execute the layout
(my/startup-layout)

(provide 'layout)
