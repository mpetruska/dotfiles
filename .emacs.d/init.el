
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

(load-user-file              "global.el")
(load-user-file           "dashboard.el")
(load-user-file "display-ansi-colors.el")
(load-user-file              "ensime.el")
(load-user-file        "haskell-mode.el")
(load-user-file    "multiple-cursors.el")
(load-user-file             "neotree.el")
(load-user-file            "org-mode.el")
(load-user-file          "projectile.el")
(load-user-file         "prolog-mode.el")
(load-user-file       "proof-general.el")
(load-user-file                 "shr.el")
(load-user-file       "visual-regexp.el")
(load-user-file          "win-switch.el")

(use-package base16-theme
  :ensure t)

(use-package night-owl-theme
  :ensure t)

(use-package zenburn-theme
  :ensure t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(default ((t (:family "Fira Code" :foundry "CYRE" :slant normal :weight normal :height 77 :width normal)))))
 '(default ((t (:family "Hack" :foundry "CYRE" :slant normal :weight normal :height 77 :width normal)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(custom-enabled-themes (quote (base16-materia)))
 ;;'(custom-enabled-themes (quote (night-owl-theme)))
 '(custom-enabled-themes (quote (zenburn-theme)))
 '(custom-safe-themes
   (quote
    ("02199888a97767d7779269a39ba2e641d77661b31b3b8dd494b1a7250d1c8dc1" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" default)))
 '(org-agenda-files
   (quote
    ("/home/mark/GitLab/org/archive.org" "/home/mark/GitLab/org/bookmarks.org" "/home/mark/GitLab/org/off-work.org" "/home/mark/GitLab/org/work.org")))
 '(package-selected-packages
   (quote
    (use-package neotree liso-theme borland-blue-theme base16-theme all-the-icons afternoon-theme))))

