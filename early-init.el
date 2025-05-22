;;; early-init.el --- Start-up settings -*- lexical-binding: t; -*-

;; Increase default garbage collection threshold
(setq gc-cons-threshold (* 32 1024 1024))

;; Prevent the glimpse of un-styled Emacs by setting these early.
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))
(add-to-list 'default-frame-alist '(vertical-scroll-bars))

;; One less file to load at startup
(setq site-run-file nil)

