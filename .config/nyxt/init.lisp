
;;(define-configuration buffer
;;  ((default-modes '(emacs-mode certificate-exception-mode base-mode))))

;;(define-configuration web-buffer
;;  ((default-modes '(dark-mode emacs-mode certificate-exception-mode web-mode base-mode))))

(define-configuration buffer
  ((default-modes (append '(auto-mode dark-mode emacs-mode) %slot-default%))))

(define-configuration buffer
  ((current-zoom-ratio 0.8)))
