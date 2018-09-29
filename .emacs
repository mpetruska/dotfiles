(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode)

(require 'package)
(setq
  package-archives '(("gnu"          . "http://elpa.gnu.org/packages/")
                     ("org"          . "http://orgmode.org/elpa/")
                     ("melpa"        . "http://melpa.org/packages/")
                     ("melpa-stable" . "http://stable.melpa.org/packages/"))
  package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(require 'use-package)

(use-package base16-theme)

(use-package all-the-icons)

(use-package neotree
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-window-width 50)
  (global-set-key [f8] 'neotree-toggle))

(use-package ensime
  :ensure t
  :pin melpa-stable)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "CYRE" :slant normal :weight normal :height 90 :width normal)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (base16-materia)))
 '(custom-safe-themes
   (quote
    ("02199888a97767d7779269a39ba2e641d77661b31b3b8dd494b1a7250d1c8dc1" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" default)))
 '(package-selected-packages
   (quote
    (use-package neotree liso-theme borland-blue-theme base16-theme all-the-icons afternoon-theme))))
