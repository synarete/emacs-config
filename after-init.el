;;; after-init.el  -*- lexical-binding: t; -*-

(defun my-start-shell ()
  (shell)
  (switch-to-buffer "*shell*"))

(add-hook 'after-init-hook #'my-start-shell)
