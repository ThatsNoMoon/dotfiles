;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

; (package! slime)

(package! ace-jump-mode
  :recipe (:fetcher github
           :repo "winterTTr/ace-jump-mode"))

(package! kotlin-mode)

(package! lsp-mode)

(package! lsp-kotlin
  :recipe (:fetcher github
           :repo "whily/lsp-kotlin"))

(package! zig-mode)

(package! highlight-indentation)

(package! aggressive-indent)
