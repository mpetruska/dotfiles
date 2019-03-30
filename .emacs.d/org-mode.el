
(use-package org
  :ensure org-plus-contrib
  :config
  (progn
    (setq org-hide-leading-stars t)
  ))

(use-package org-bullets
  :ensure t
  :init
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

