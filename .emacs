(require 'package)

(add-to-list 'package-archives '("org"   . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))

(setq package-enable-at-startup nil)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
         (package-install package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

(ensure-package-installed 'base16-theme 'neotree 'all-the-icons)

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode)

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(global-set-key [f8] 'neotree-toggle)

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
    ("d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" default)))
 '(package-selected-packages
   (quote
    (neotree liso-theme darcula-theme brutalist-theme boron-theme borland-blue-theme blackboard-theme base16-theme badwolf-theme atom-one-dark-theme atom-dark-theme arjen-grey-theme apropospriate-theme ample-zen-theme ample-theme all-the-icons alect-themes ahungry-theme afternoon-theme abyss-theme))))
