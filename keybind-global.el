;;; keybind-gud.el -- Key-binding mappings -*- lexical-binding: t; -*-

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

(defun my-compile-make ()
  "Compile with `make`"
  (interactive)
  (projectile-with-default-dir (projectile-acquire-root)
    (compile "make")))

(defun my-compile-make-clean ()
  "Compile-clean with `make`"
  (interactive)
  (projectile-with-default-dir (projectile-acquire-root)
    (compile "make clean")))

(defun my-start-shell ()
  "Start shell"
  (interactive)
  (shell)
  (switch-to-buffer "*shell*")
  (delete-other-windows))

(defun my-global-set-keys (keymap bindings)
  "Set multiple key BINDINGS in a KEYMAP."
  (dolist (binding bindings)
    (define-key keymap (kbd (car binding)) (cdr binding))))

;; Start a search for the symbol under the cursor with C-f
(global-set-key (kbd "C-f") 'isearch-forward-symbol-at-point)

;; Define key mappings
(setq my-key-bindings
      '(
        ("C-o"          . find-file)               ; Open file
        ("C-a"          . mark-whole-buffer)       ; Select all buffer
        ("C-p"          . pop-global-mark)         ; Jump to previous position
        ("C-x g"        . goto-line)               ; Go to specific line
        ("C-x s"        . save-buffer)             ; Save buffer
        ("C-x q"        . save-buffers-kill-emacs) ; Save and quit Emacs
        ("C-x k"        . kill-current-buffer)     ; Kill current buffer
        ("C-x C-s"      . my-save-all-buffers)     ; Save all modified buffers
        ("<f1>"         . treemacs)                ; Open Treemacs
        ("<f2>"         . ibuffer)                 ; Pop Ibuffer
        ;; Build/clean project with make
        ("<f3>"         . my-compile-make)
        ("C-<f3>"       . my-compile-make-clean)
        ;; Shell
        ("<f4>"         . my-start-shell)
        ;; Window resize
        ("C-S-<left>"   . shrink-window-horizontally)
        ("C-S-<right>"  . enlarge-window-horizontally)
        ("C-S-<down>"   . shrink-window)
        ("C-S-<up>"     . enlarge-window)
        ;; Cycle buffers
        ("M-S-<left>"   . previous-buffer)
        ("M-S-<right>"  . next-buffer)
        ))

;; Apply the keybindings
(my-global-set-keys global-map my-key-bindings)
