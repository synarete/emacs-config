;;; early-init.el --- Start-up settings -*- lexical-binding: t; -*-

;; Which emacs do we use?
(message "[ GNU/Emacs %s ]" emacs-version)

;; Require GNU Emacs 30.1 or more
(when (version< emacs-version "30.1")
  (error "Requires GNU Emacs 30.1 or newer (current: %s)" emacs-version))

;; Prevent the glimpse of un-styled Emacs by setting these early.
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))

;; One less file to load at startup
(setq site-run-file nil)
