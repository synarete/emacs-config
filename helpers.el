;;; helpers.el --- Common helper functions -*- lexical-binding: t; -*-

(defun my-load-user-init (file-name)
  "Load an init-configuration FILE-NAME from `user-emacs-directory`."
  (let ((file-path (expand-file-name file-name user-emacs-directory)))
    (if (not (file-exists-p file-path))
        (message "File not found: %s" file-path)
      (condition-case err
          (progn
            (load file-path nil t)
            (message "Loaded %s" file-path))
        (error
         (message "Error loading %s: %s" file-path
                  (error-message-string err)))))))

;; Usage:
(provide 'helpers)
