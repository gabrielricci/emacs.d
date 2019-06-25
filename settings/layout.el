;; layout definition
(defun my-startup-layout ()
 (interactive)
 (delete-other-windows)
 (split-window-horizontally)
 (next-multiframe-window)
 (ansi-term "/bin/bash")
 (next-multiframe-window)
)

;; execute the layout
(my-startup-layout )

(provide 'layout)
