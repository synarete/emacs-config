;;; early-init.el --- Start-up settings -*- lexical-binding: t; -*-
(message "[ Early init (user: %s) ]" (user-login-name))

;; Prevent the glimpse of un-styled Emacs by setting these early.
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))

;; One less file to load at startup
(setq site-run-file nil)

;; Bring on helpers
(load (expand-file-name "helpers.el" user-emacs-directory))
