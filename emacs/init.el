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

(use-package electric
  :ensure t)

(use-package anzu
  :ensure t)

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

(use-package meghanada
  :ensure t
  :config
  (setq meghanada-java-path "java")
  (setq meghanada-maven-path "mvn"))

(defun java-hook ()
  (meghanada-mode t)
  (flycheck-mode +1)
  (setq c-basic-offset 4)
  (add-hook 'before-save-hook 'meghanada-code-beautify-before-save))

(add-hook 'java-mode-hook 'java-hook)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (restart-emacs anzu org-bullets which-key evil-snipe evil-surround meghanada evil-mode use-package evil ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
