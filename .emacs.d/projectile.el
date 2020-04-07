
(use-package projectile
  :ensure t
  :pin melpa-stable
  :config
    (define-key projectile-mode-map (kbd "s-p")   'projectile-command-map)
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
    (define-key projectile-mode-map (kbd "<f5>")
      (lambda(arg)
        (interactive "P")
        (let ((compilation-read-command nil))
          (projectile-compile-project arg))
      )
    )
    (projectile-mode +1)
    (setq projectile-project-search-path '("~/GitHub/" "~/Wst/GitLab/"))
    (projectile-register-project-type 'bloop '(".bloop")
                                  :compile     "bloop compile --reporter scalac --no-color root"
                                  :test        "bloop test --propagate --reporter scalac --no-color root"
                                  :src-dir     "src/main/"
                                  :test-dir    "src/test/"
                                  :test-suffix "Spec")
)
