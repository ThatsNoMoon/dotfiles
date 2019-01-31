;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(map! :leader
      :desc "Ace word jump" "a" #'ace-jump-word-mode
      :desc "Ace line jump" "l" #'ace-jump-line-mode)

(map! :leader
      (:prefix "t"
        :desc "Aggressive indent mode" "a" #'aggressive-indent-mode))


(add-hook! 'prog-mode-hook #'highlight-indentation-mode)
(setq highlight-indentation-blank-lines t)

(add-hook! 'lisp-mode-hook #'aggressive-indent-mode)
