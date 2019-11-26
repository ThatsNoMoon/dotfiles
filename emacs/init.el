(org-babel-load-file (concat user-emacs-directory "config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "~/.local/share/emacs/backups/"))))
 '(company-idle-delay 0.25)
 '(css-indent-offset 2)
 '(cua-mode t nil (cua-base))
 '(electric-pair-mode t)
 '(evil-snipe-mode t)
 '(helm-mode t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice "~/Development")
 '(initial-scratch-message ";; *scratch* buffer

")
 '(line-number-mode t)
 '(package-selected-packages
   (quote
    (visual-fill-column lsp-mode shackle yasnippet-snippets powerline-evil powerline showkey smartparens smartparents shell-pop js2-refactor web-mode rainbow-delimiters alchemist ace-jump-mode evil-args evil-exchange evil-visualstar helm-everywhere anzu-evil htmlize intero restart-emacs anzu org-bullets which-key evil-snipe evil-surround meghanada evil-mode use-package evil ace-window)))
 '(rainbow-delimiters-max-face-count 4)
 '(shell-pop-shell-type
   (quote
    ("ansi-term" "*ansi-term*"
     (lambda nil
       (ansi-term shell-pop-term-shell)))))
 '(web-mode-attr-indent-offset 2)
 '(web-mode-attr-value-indent-offset 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(which-key-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(powerline-evil-emacs-face ((t (:inherit powerline-evil-base-face :background "violet" :foreground "grey20"))))
 '(powerline-evil-insert-face ((t (:inherit powerline-evil-base-face :background "#61AFEF" :foreground "grey20"))))
 '(powerline-evil-motion-face ((t (:inherit powerline-evil-base-face :background "magenta" :foreground "grey20"))))
 '(powerline-evil-normal-face ((t (:inherit powerline-evil-base-face :background "#98C379" :foreground "grey20"))))
 '(powerline-evil-operator-face ((t (:inherit powerline-evil-base-face :background "#56B6C2" :foreground "grey20"))))
 '(powerline-evil-replace-face ((t (:inherit powerline-evil-base-face :background "#BE5046" :foreground "grey20"))))
 '(powerline-evil-visual-face ((t (:inherit powerline-evil-base-face :background "#E5C07B" :foreground "grey20"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#61AFEF"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#C678DD"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#98C379"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#E5C07B"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#E5C07B"))))
 '(rainbow-delimiters-mismatched-face ((t (:inherit (rainbow-delimiters-unmatched-face rainbow-delimiters-base-face)))))
 '(whitespace-line ((t (:background "gray20" :foreground "firebrick2")))))
