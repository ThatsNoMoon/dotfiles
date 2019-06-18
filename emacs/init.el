(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package one-themes
  :ensure t
  :config
  (load-theme 'one-dark t))

(use-package evil
  :ensure t
  :config
  (evil-mode))

(use-package evil-surround
  :ensure t)

(use-package evil-snipe
  :ensure t)

(use-package which-key
  :ensure t)

(use-package org-bullets
  :ensure t)

(use-package flycheck
  :ensure t)

(use-package company
  :ensure t)

(use-package magit
  :ensure t)

(use-package anzu
  :ensure t
  :config
  (global-anzu-mode +1))

(use-package restart-emacs
  :ensure t)

(use-package helm
  :ensure t
  :config
  (helm-mode))

(use-package projectile
  :ensure t)

(use-package helm-projectile
  :ensure t)

(use-package imenu-anywhere
  :ensure t)

(use-package highlight-indentation
  :ensure t)

(use-package intero
  :ensure t)

(use-package htmlize
  :ensure t)

(use-package meghanada
  :ensure t
  :config
  (setq meghanada-java-path "java")
  (setq meghanada-maven-path "mvn"))

(electric-pair-mode)

(defun java-hook ()
  (meghanada-mode t)
  (flycheck-mode +1)
  (setq c-basic-offset 4)
  (add-hook 'before-save-hook 'meghanada-code-beautify-before-save))

(add-hook 'java-mode-hook 'java-hook)

(defun my-org-inline-css-hook (exporter)
  "Insert custom inline css"
  (when (eq exporter 'html)
    (let* ((dir (ignore-errors (file-name-directory (buffer-file-name))))
           (path (concat dir "style.css"))
           (homestyle (or (null dir) (null (file-exists-p path))))
           (final (if homestyle "~/.emacs.d/org-style.css" path)))
      (setq org-html-head-include-default-style nil)
      (setq org-html-head (concat
                           "<style type=\"text/css\">\n"
                           "<!--/*--><![CDATA[/*><!--*/\n"
                           (with-temp-buffer
                             (insert-file-contents final)
                             (buffer-string))
                           "/*]]>*/-->\n"
                           "</style>\n")))))

(add-hook 'org-export-before-processing-hook 'my-org-inline-css-hook)

(setq org-latex-packages-alist '(("margin=1in" "geometry" nil)))
(setq org-latex-toc-command "\\tableofcontents \\clearpage")

(setq inferior-lisp-program "/usr/bin/sbcl")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(electric-pair-mode t)
 '(helm-mode t)
 '(line-number-mode nil)
 '(package-selected-packages
   (quote
    (helm-everywhere anzu-evil htmlize intero restart-emacs anzu org-bullets which-key evil-snipe evil-surround meghanada evil-mode use-package evil ace-window)))
 '(which-key-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
