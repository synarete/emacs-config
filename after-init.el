;;; after-init.el  -*- lexical-binding: t; -*-

;; Load custom file
(when (file-exists-p custom-file)
  (load custom-file 'noerror))

;; Open Treemacs
(defun my-treemacs-select-window ()
  (lambda ()
    (when (fboundp 'treemacs-select-window)
      (treemacs-select-window))))

(add-hook 'after-init-hook #'my-treemacs-select-window)

;; Full-screen by default
(add-hook 'after-init-hook #'toggle-frame-fullscreen)
