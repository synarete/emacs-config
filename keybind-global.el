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
  "Save all modified file-visited buffers."
  (interactive)
  (let ((count (my-num-visited-modified-buffers)))
    (cond
     ((> count 0)
      (save-some-buffers t)
      (message "Saved %d buffers" count))
     (t
      (message "No buffers need saving")))))

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

(defun my-global-set-keys (keymap bindings)
  "Set multiple key BINDINGS in a KEYMAP."
  (dolist (binding bindings)
    (define-key keymap (kbd (car binding)) (cdr binding))))

;; Start a search for the symbol under the cursor with C-f
(global-set-key (kbd "C-f") 'isearch-forward-symbol-at-point)

;; Define key mappings
(setq my-key-bindings
      '(
        ("<f1>"         . treemacs)                ; Open Treemacs
        ("<f2>"         . ibuffer)                 ; Pop Ibuffer
        ("C-x s"        . save-buffer)             ; Save buffer
        ("C-x q"        . save-buffers-kill-emacs) ; Save and quit Emacs
        ("C-x C-s"      . my-save-all-buffers)     ; Save all modified buffers
        ("C-x g"        . goto-line)               ; Go to specific line
        ("C-o"          . find-file)               ; Open file
        ("C-x k"        . kill-current-buffer)     ; Kill current buffer
        ("C-p"          . pop-global-mark)         ; Jump to previous position
        ("C-a"          . mark-whole-buffer)       ; Select all buffer
        ;; Search
        ("C-f"          . isearch-forward-symbol-at-point) ; Search symbol
        ("C-S-f"        . isearch-repeat-forward)  ; Search next symbol
        ;; Build/clean project with make
        ("<f3>"         . my-compile-make)
        ("C-<f3>"       . my-compile-make-clean)
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
