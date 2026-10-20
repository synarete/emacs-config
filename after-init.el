;;; after-init.el  -*- lexical-binding: t; -*-

;; Full-screen by default
(when (display-graphic-p)
  (add-hook 'after-init-hook #'toggle-frame-fullscreen))

;; Load custom file
(when (file-exists-p custom-file)
  (load custom-file 'noerror))
