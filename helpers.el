;;; helpers.el --- Common helper functions -*- lexical-binding: t; -*-

(defun my-user-config (file-name)
  "Load a configuration FILE-NAME from the user-emacs-directory."
  (let ((file-path (expand-file-name file-name user-emacs-directory)))
    (load file-path)))

(provide 'helpers)
