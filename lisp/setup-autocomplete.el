(load "auto-complete.el")
(load "auto-complete-config.el")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(require 'auto-complete)
(global-auto-complete-mode t)
