;;; keybind-global.el -- Key-binding mappings -*- lexical-binding: t; -*-

(defun my-num-visited-modified-buffers ()
  "Return the number of visited and modified buffers."
  (length
   (cl-remove-if-not
    (lambda (buf)
      (and (buffer-modified-p buf)
           (buffer-file-name buf)))
    (buffer-list))))

(defun my-save-all-buffers ()
  "Save all modified file-visited buffers with error handling."
  (interactive)
  (condition-case err
      (let ((count (my-num-visited-modified-buffers)))
        (cond
         ((> count 0)
          (save-some-buffers t)
          (message "Saved %d buffers" count))
         (t
          (message "(No buffers need to be saved)"))))
    (error
     (message "An error occurred while saving buffers: %s"
              (error-message-string err)))))

(defun my-save-and-quit ()
  "Save all buffers silently and kill Emacs."
  (interactive)
  (save-some-buffers t)
  (kill-emacs))

(defun my-global-set-keys (keymap bindings)
  "Set multiple key BINDINGS in a KEYMAP."
  (dolist (binding bindings)
    (define-key keymap (kbd (car binding)) (cdr binding))))

;; Define key mappings
(defvar my-key-bindings
      '(
        ("C-o"     . find-file)
        ("C-x a"   . mark-whole-buffer)
        ("C-x g"   . goto-line)
        ("C-x s"   . save-buffer)
        ("C-x k"   . kill-current-buffer)
        ("C-x C-s" . my-save-all-buffers)
        ("C-x C-q" . my-save-and-quit)
        ("M-S-<left>"  . previous-buffer)
        ("M-S-<right>" . next-buffer)
        ("M-S-+" . enlarge-window)
        ("M-+"   . enlarge-window-horizontally)
        ("M-S--" . shrink-window)
        ("M--"   . shrink-window-horizontally)
        ))

;; Apply the keybindings
(my-global-set-keys global-map my-key-bindings)

