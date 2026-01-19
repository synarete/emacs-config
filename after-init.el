;;; after-init.el  -*- lexical-binding: t; -*-

;; Open treemacs
(add-hook 'after-init-hook #'treemacs-select-window)

;; Full-screen by default
(add-hook 'after-init-hook #'toggle-frame-fullscreen)
