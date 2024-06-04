;;; keybind.el -- Private Emacs key-binding

;; Delete TABs the normal way
(setq backward-delete-char-untabify-method 'hungry)

;; Save
(global-set-key (kbd "C-x s") 'save-buffer)

;; Save all (without prompting for yes-or-no)
(defun save-some-buffers-now ()
  (interactive)
  (save-some-buffers t t))
(global-set-key (kbd "M-s") 'save-some-buffers-now)

;; Save and quit
(global-set-key (kbd "C-x q") 'save-buffers-kill-emacs)

;; Goto line
(global-set-key (kbd "C-x g") 'goto-line)

;; Ctrl-o to open a (new) file
(global-set-key (kbd "C-o") 'find-file)

;; Ctrl-k to close current file (buffer)
(global-set-key (kbd "C-k") 'kill-this-buffer)

;; Mark all
(global-set-key (kbd "C-a") 'mark-whole-buffer)

;; Window switching
(windmove-default-keybindings 'control)
(global-set-key (kbd "<C-up>") 'windmove-up)
(global-set-key (kbd "<C-down>") 'windmove-down)
(global-set-key (kbd "<C-left>") 'windmove-left)
(global-set-key (kbd "<C-right>") 'windmove-right)

;; Use cua-mode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil)
(transient-mark-mode 1)
(setq cua-keep-region-after-copy t)

;; Yank with middle mouse
(setq mouse-yank-at-point t)
