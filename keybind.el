;;; keybind.el -- Private Emacs key-binding

;; Delete TABs the normal way
(setq backward-delete-char-untabify-method nil)

;; Save
(global-set-key (kbd "C-x s") 'save-buffer)

;; Save and quit
(global-set-key (kbd "C-x q") 'save-buffers-kill-emacs)

;; Save-all (remapped)
(defun my-save-all-buffers ()
  (interactive)
  (message "Save some buffers")
  (save-some-buffers t))

(global-set-key (kbd "C-x C-s") #'my-save-all-buffers)

;; Goto line
(global-set-key (kbd "C-x g") 'goto-line)

;; Ctrl-o to open a (new) file
(global-set-key (kbd "C-o") 'find-file)

;; Ctrl-k to close current file (buffer)
(global-set-key (kbd "C-k") 'kill-this-buffer)

;; Mark all
(global-set-key (kbd "C-x a") 'mark-whole-buffer)

;; Ctrl-f for search symbol in buffer
(global-set-key (kbd "C-f") 'isearch-forward-symbol-at-point)
(define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)


;; Window switching
(windmove-default-keybindings 'control)

;; Window resize
;; https://www.emacswiki.org/emacs/WindowResize
(global-set-key (kbd "C-S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-S-<down>") 'shrink-window)
(global-set-key (kbd "C-S-<up>") 'enlarge-window)

;; Yank with middle mouse
(setq mouse-yank-at-point t)

;; Use cua-mode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil)
(transient-mark-mode 1)
(setq cua-keep-region-after-copy t)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Terminal
(defun my-term ()
  (interactive)
  (message "Terminal")
  (term "/bin/bash"))

(global-set-key (kbd "C-x t") 'my-term)

;; Toggle treemacs with F1
(global-set-key (kbd "<f1>") 'treemacs)

;; Pop ibuffer with F2
(global-set-key (kbd "<f2>") 'ibuffer)

;; Build (or clean) project with F3
(defun my-make-build-default ()
  (interactive)
  (projectile-with-default-dir (projectile-acquire-root)
    (compile "make")))

(defun my-make-build-clean ()
  (interactive)
  (projectile-with-default-dir (projectile-acquire-root)
    (compile "make clean")))

(global-set-key (kbd "<f3>") #'my-make-build-default)
(global-set-key (kbd "C-<f3>") #'my-make-build-clean)

;; Debugging
(require 'gud)
(define-key gud-mode-map (kbd "<up>") 'comint-previous-input)
(define-key gud-mode-map (kbd "<down>") 'comint-next-input)
(define-key gud-minor-mode-map (kbd "<f5>") #'gud-next)
(define-key gud-minor-mode-map (kbd "<f6>") #'gud-step)
(define-key gud-minor-mode-map (kbd "<f7>") #'gud-finish)
