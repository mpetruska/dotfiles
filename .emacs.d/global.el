(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode)

(require 'package)
(setq
  package-archives '(("gnu"          . "http://elpa.gnu.org/packages/")
                     ("org"          . "http://orgmode.org/elpa/")
                     ("melpa"        . "http://melpa.org/packages/")
                     ("melpa-stable" . "http://stable.melpa.org/packages/"))
  package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(require 'use-package)

