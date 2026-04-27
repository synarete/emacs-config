;;; early-init.el --- Start-up settings -*- lexical-binding: t; -*-
(message "[ Early init (user: %s) ]" (user-login-name))

;; Require GNU Emacs 30.1 or more
(when (version< emacs-version "30.1")
  (error "This configuration requires GNU Emacs 30.1 or newer (current: %s)"
         emacs-version))

;; Prevent the glimpse of un-styled Emacs by setting these early.
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))

;; One less file to load at startup
(setq site-run-file nil)

;; Bring on helpers
(load (expand-file-name "helpers.el" user-emacs-directory))
