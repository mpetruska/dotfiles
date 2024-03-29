
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode)
(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode nil)
(set-default 'truncate-lines t)
(global-set-key "\C-c$" 'toggle-truncate-lines)
(setq browse-url-browser-function 'eww-browse-url)

(require 'package)
(setq
  package-archives '(("gnu"          . "http://elpa.gnu.org/packages/")
                     ;; ("org"          . "http://orgmode.org/elpa/")
                     ("melpa"        . "http://melpa.org/packages/")
                     ("melpa-stable" . "http://stable.melpa.org/packages/"))
  package-archive-priorities '(("melpa-stable" . 20)
                               ("gnu" . 10)
                               ("melpa" . 0)))

;; (package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(require 'use-package)

(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(use-package tramp
  :ensure t)
