
(use-package all-the-icons
  :ensure t
  :pin melpa-stable)

(use-package neotree
  :ensure t
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-window-width 50)
  (global-set-key [f8] 'neotree-toggle))

