
(global-prettify-symbols-mode +1)

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
(load-user-file           "exec-path.el")
(load-user-file        "haskell-mode.el")
;; (load-user-file              "metals.el")
(load-user-file    "multiple-cursors.el")
(load-user-file             "neotree.el")
(load-user-file            "org-mode.el")
(load-user-file          "projectile.el")
;; (load-user-file         "prolog-mode.el")
(load-user-file       "proof-general.el")
(load-user-file                 "shr.el")
;; (load-user-file       "visual-regexp.el")
(load-user-file          "win-switch.el")

(use-package zenburn-theme
  :ensure t
  :defer  t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "FantasqueSansMono Nerd Font Mono" :foundry "CYRE" :slant normal :weight normal :height 75 :width normal)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("78e9a3e1c519656654044aeb25acb8bec02579508c145b6db158d2cfad87c44e" "84890723510d225c45aaff941a7e201606a48b973f0121cb9bcb0b9399be8cba" default))
 '(org-agenda-files
   '("/home/mark/GitLab/org/archive.org" "/home/mark/GitLab/org/bookmarks.org" "/home/mark/GitLab/org/off-work.org" "/home/mark/GitLab/org/work.org"))
 '(package-selected-packages
   '(posframe lsp-treemacs zenburn-theme yasnippet win-switch visual-regexp use-package tablist spacegray-theme scala-mode sbt-mode proof-general projectile popup paganini-theme overcast-theme org-plus-contrib org-bullets night-owl-theme neotree multiple-cursors lsp-ui haskell-mode gruber-darker-theme flycheck diminish dashboard darkburn-theme cyberpunk-theme company-lsp color-theme-sanityinc-tomorrow base16-theme auto-package-update all-the-icons))
 '(safe-local-variable-values
   '((projectile-project-compilation-cmd . "bloop compile --reporter scalac --no-color CherriskAPI-test")
     (projectile-project-compilation-cmd . "bloop compile --reporter scalac --no-color CherriskAPI")))
 '(tramp-verbose 6))

(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
