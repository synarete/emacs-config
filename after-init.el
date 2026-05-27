;;; after-init.el  -*- lexical-binding: t; -*-

;; Open treemacs
;; (add-hook 'after-init-hook #'treemacs-select-window)

;; Full-screen by default
(defun my-frame-size ()
  (when (display-graphic-p)
    (toggle-frame-fullscreen)))

(add-hook 'after-init-hook #'my-frame-size)

;; Load custom file
(when (file-exists-p custom-file)
  (load custom-file 'noerror))
