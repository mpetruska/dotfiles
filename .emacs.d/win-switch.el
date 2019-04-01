
(use-package win-switch
  :ensure t
  :config
  (progn
    (global-set-key "\C-xo" 'win-switch-dispatch))
    (setq win-switch-idle-time 3))

