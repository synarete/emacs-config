;;; early-init.el --- Start-up settings -*- lexical-binding: t; -*-

;; Increase default garbage collection thresholds for startup
(setq gc-cons-threshold (* 64 1024 1024))
(setq gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 8 1024 1024))
            (setq gc-cons-percentage 0.1)))

;; Prevent the glimpse of un-styled Emacs by setting these early.
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))
(add-to-list 'default-frame-alist '(vertical-scroll-bars))

;; One less file to load at startup
(setq site-run-file nil)
