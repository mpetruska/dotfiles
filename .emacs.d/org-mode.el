
(use-package org
  :ensure t
  :config
  (progn
    (global-set-key (kbd "C-c a") 'org-agenda)
    (setq org-hide-leading-stars t)
    (setq org-agenda-files (list "~/GitLab/org"))
    (setq org-archive-location "~/GitLab/org/archive.org::")
  ))

(use-package org-bullets
  :ensure t
  :init
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
