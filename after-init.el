;;; after-init.el  -*- lexical-binding: t; -*-

;; Load custom file
(when (file-exists-p custom-file)
  (load custom-file 'noerror))
