
;; Enable defer and ensure by default for use-package
;; Keep auto-save/backup files separate from source code:  https://github.com/scalameta/metals/issues/1027
(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Enable scala-mode and sbt-mode
(use-package scala-mode
  :ensure t
  :defer  t
  :mode "\\.s\\(cala\\|bt\\)$"
  :pin melpa)

(use-package sbt-mode
  :ensure t
  :defer  t
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
   ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
   (setq sbt:program-options '("-Dsbt.supershell=false"))
  :pin melpa)

;; Enable nice rendering of diagnostics like compile errors.
(use-package flycheck
  :ensure t
  :defer  t
  :init (global-flycheck-mode)
  :pin melpa)

(use-package lsp-mode
  ;; Optional - enable lsp-mode automatically in scala files
  :ensure t
  :defer  t
  :init (setq lsp-keymap-prefix "C-c l")
  :hook (scala-mode . lsp)
        (lsp-mode . lsp-lens-mode)
  :config (setq lsp-prefer-flymake nil)
  :pin melpa)

(use-package posframe
  :ensure t
  :defer  t
  :pin melpa)

(use-package lsp-metals
  :ensure t
  :defer  t
  :pin melpa)

(use-package lsp-ui
  :ensure t
  :defer  t
  :init (setq lsp-ui-sideline-show-hover t)
  :pin melpa)

;; lsp-mode supports snippets, but in order for them to work you need to use yasnippet
;; If you don't want to use snippets set lsp-enable-snippet to nil in your lsp-mode settings
;;   to avoid odd behavior with snippets and indentation
(use-package yasnippet
  :ensure t
  :defer  t
  :pin melpa)

;; Add company-lsp backend for metals
(use-package company-lsp
  :ensure t
  :defer  t
  :pin melpa)

(use-package dap-mode
  :ensure t
  :defer  t
  :hook (lsp-mode . dap-mode)
        (lsp-mode . dap-ui-mode)
  :pin melpa)

(use-package lsp-treemacs
  :ensure t
  :defer  t
  :config (lsp-metals-treeview-enable t)
          (setq lsp-metals-treeview-show-when-views-received t)
  :pin melpa)
