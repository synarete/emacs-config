;;; helpers.el --- Common helper functions -*- lexical-binding: t; -*-

(require 'cl-lib)

(cl-defun my-load-user-init (file-name &key needs graphic)
  "Load a init-configuration FILE-NAME from the user-emacs-directory."
  (let ((file-path (expand-file-name file-name user-emacs-directory)))
    (cond
     ;; Check if packages are missing
     ((and needs (not (cl-every #'package-installed-p needs)))
      (message "Not loading %s due to missing packages %s" file-path needs))

     ;; Execute only when graphic display enabled
     ((and graphic (not (display-graphic-p)))
      (message "Not loading %s (non display-graphic mode)" file-path))

     ;; Check if file exists
     ((not (file-exists-p file-path))
      (message "File not found: %s" file-path))

     ;; Load the file
     (t
      (load file-path)))))

;; Usage:
(provide 'helpers)
