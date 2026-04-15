;;; after-init.el  -*- lexical-binding: t; -*-

;; Load custom file
(when (file-exists-p custom-file)
  (load custom-file 'noerror))

;; Open treemacs
(add-hook 'after-init-hook #'treemacs-select-window)

;; Full-screen by default
(add-hook 'after-init-hook #'toggle-frame-fullscreen)
