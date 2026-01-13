;;; helpers.el --- Common helper functions -*- lexical-binding: t; -*-

(require 'cl-lib)

(defun my-user-config (file-name &optional packages)
  "Load a configuration FILE-NAME from the user-emacs-directory."
  (let ((file-path (expand-file-name file-name user-emacs-directory)))
    (when (or (null packages) (cl-every #'package-installed-p packages))
      (if (file-exists-p file-path)
          (load file-path)
        (message "Config file not found: %s" file-path)))))

(provide 'helpers)
