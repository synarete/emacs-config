;;; helpers.el --- Common helper functions -*- lexical-binding: t; -*-

(require 'cl-lib)

(cl-defun my-user-config (file-name &key needs when)
  "Load a configuration FILE-NAME from the user-emacs-directory."
  (let ((file-path (expand-file-name file-name user-emacs-directory)))
    (cond
     ;; Check if packages are missing
     ((and needs (not (cl-every #'package-installed-p needs)))
      (message "Not loading %s due to missing packages %s" file-path needs))

     ;; Execute only when provided predicate is true
     ((and when (not (funcall when)))
      (message "Not loading %s (not %s)" file-path when))

     ;; Check if file exists
     ((not (file-exists-p file-path))
      (message "File not found: %s" file-path))

     ;; Load the file
     (t (load file-path)))))

;; Usage:
(provide 'helpers)
