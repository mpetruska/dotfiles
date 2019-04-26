
(eval-after-load 'shr
  '(progn (setq shr-width -1)
          (defun shr-fill-text (text) text)
          (defun shr-fill-lines (start end) nil)
          (defun shr-fill-line () nil)))

(defadvice shr-fill-text (around shr-no-fill-text activate)
  "Do not fill text when `shr-no-fill-mode' is enabled."
  (if (bound-and-true-p shr-no-fill-mode)
      (ad-get-arg 0)
    ad-do-it))

(defadvice shr-fill-lines (around shr-no-fill-lines activate)
  "Do not fill text when `shr-no-fill-mode' is enabled."
  (unless (bound-and-true-p shr-no-fill-mode)
    ad-do-it))

(defadvice shr-fill-line (around shr-no-fill-line activate)
  "Do not fill text when `shr-no-fill-mode' is enabled."
  (unless (bound-and-true-p shr-no-fill-mode)
    ad-do-it))

(define-minor-mode shr-no-fill-mode
  "Global minor mode which prevents `shr' and `eww' from filling text output."
  ;; :lighter (:eval (if (derived-mode-p 'eww-mode) " ShrNoFill"))
  :global t)

(shr-no-fill-mode 1)
