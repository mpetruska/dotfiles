
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
	  user-emacs-directory)
        ((boundp 'user-init-directory)
          user-init-directory)
        (t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file           "global.el")
(load-user-file        "dashboard.el")
(load-user-file           "ensime.el")
(load-user-file "multiple-cursors.el")
(load-user-file          "neotree.el")
(load-user-file       "projectile.el")

(use-package base16-theme
  :ensure t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "CYRE" :slant normal :weight normal :height 80 :width normal)))))
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