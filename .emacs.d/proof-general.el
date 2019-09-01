
(use-package proof-general
  :ensure t
  :pin melpa
  :config (setq coq-prog-name "/home/mark/.opam/ocaml-base-compiler/bin/coqtop"))

(add-hook 'coq-mode-hook
          (lambda ()
            (progn (push '("forall" . ?∀) prettify-symbols-alist)
                   (push '("exists" . ?∃) prettify-symbols-alist))))
