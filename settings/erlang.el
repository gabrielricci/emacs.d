(setq erlang-root-dir "~/.asdf/installs/erlang/19.3/lib/tools-2.9.1/emacs/")
(setq erlang-bin-dir "~/.asdf/installs/erlang/19.3/bin")
(setq erlang-man-dir "~/.asdf/installs/erlang/19.3/man")
(add-to-list 'load-path erlang-root-dir)
(add-to-list 'exec-path erlang-bin-dir)
(require 'erlang-start)
(require 'flycheck)
(require 'flycheck-elixir)

(setq erlang-electric-commands
  '(erlang-electric-comma
    erlang-electric-semicolon
    erlang-electric-newline
    erlang-electric-gt))

(setq-default flycheck-disabled-checkers '(erlang erlang-rebar3))

(flycheck-define-checker erlang-emacs-erlang-compiler
  "An Erlang syntax checker based on https://github.com/vim-erlang/vim-erlang-compiler

See URL `https://github.com/vim-erlang/vim-erlang-compiler/'."
  :command ("escript"
	    (eval (expand-file-name "erlang_check.erl" bin-dir))
	    source-inplace)
  :error-patterns
  ((warning line-start (file-name) ":" line ": Warning:" (message) line-end)
   (error line-start (file-name) ":" line ": " (message) line-end))
  :modes erlang-mode)

(add-hook 'erlang-mode-hook
          (lambda ()
            (flycheck-mode)
            (flycheck-select-checker 'erlang-emacs-erlang-compiler)
            (setq flycheck-idle-change-delay 3)
            (setq flycheck-check-syntax-automatically '(mode-enabled save idle-change))))

(add-hook 'elixir-mode-hook
          (lambda ()
            (alchemist-mode)
            (flycheck-mode)
            (flycheck-select-checker 'flycheck-elixir)))

(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

(setq alchemist-key-command-prefix (kbd "C-c .")) ;; dteefault: (kbd "C-c a")

(provide 'erlang)
