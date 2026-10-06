;;; helpers.el --- Common helper functions -*- lexical-binding: t; -*-

(require 'cl-lib)

(cl-defun my-load-user-init (file-name &key needs graphic term)
  "Load a init-configuration FILE-NAME from the user-emacs-directory.
NEEDS: List of required packages (symbols)
GRAPHIC: If non-nil, only load in graphical display mode"
  (let ((file-path (expand-file-name file-name user-emacs-directory)))
    (condition-case err
        (cond
         ;; Check if packages are missing
         ((and needs (not (cl-every #'package-installed-p needs)))
          (message "Not loading %s due to missing packages %s" file-path needs))
         ;; Load only when graphic display enabled
         ((and graphic (not (display-graphic-p)))
          (message "Not loading %s (non display-graphic mode)" file-path))
         ;; Load only when non-graphic (terminal) mode
         ((and term (display-graphic-p))
          (message "Not loading %s (not in terminal mode)" file-path))
         ;; Check if file exists
         ((not (file-exists-p file-path))
          (message "File not found: %s" file-path))
         ;; Load the file
         (t
          (load file-path)))
      (error
       (message "Error loading %s: %s" file-path (error-message-string err))))
    ))

(defun my-setup-buffer-margins (buf)
  "Forcefully inject margins into the live window showing BUF."
  (run-with-timer 0.05 nil
                  (lambda (b)
                    (when-let ((win (get-buffer-window b)))
                      (set-window-margins win 2 2)))
                  buf))

;; Usage:
(provide 'helpers)
