;;; helpers.el --- Common helper functions -*- lexical-binding: t; -*-

(require 'cl-lib)

(cl-defun my-user-config (file-name &key needs)
  "Load a configuration FILE-NAME from the user-emacs-directory."
  (let ((file-path (expand-file-name file-name user-emacs-directory)))
    (when
        (or
         (null needs)
         (cl-every #'package-installed-p needs))
      (if (file-exists-p file-path)
          (load file-path)
        (message "Config file not found: %s" file-path)))))

(cl-defun my-user-config-if (pred file-name)
  "Load FILE-NAME only if PRED is true."
  (when pred (my-user-config file-name)))

;; Usage:
(provide 'helpers)
