;;; early-init.el --- Start-up settings -*- lexical-binding: t; -*-
(message "[ Early init emacs (user: %s) ]" (user-login-name))

;; Increase default garbage collection thresholds for startup
(setq gc-cons-threshold (* 64 1024 1024))
(setq gc-cons-percentage 0.6)

;; Prevent the glimpse of un-styled Emacs by setting these early.
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))
(add-to-list 'default-frame-alist '(vertical-scroll-bars))

;; One less file to load at startup
(setq site-run-file nil)
