(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(inhibit-startup-screen t)
 '(package-selected-packages '(xclip zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(xclip-mode 1)
(load-theme 'zenburn t)

(add-to-list 'default-frame-alist
	     '(font . "Iosevka-10"))

(global-display-line-numbers-mode 1)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(set-frame-parameter nil 'alpha-backgroud 69)
(add-to-list 'default-frame-alist '(alpha-background . 69))

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

(setq visible-bell 1)
