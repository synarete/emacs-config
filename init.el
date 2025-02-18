;;; init.el --- Initialization file for Emacs -*- lexical-binding: t; -*-
(message "[ Start emacs (user: %s) ]" (user-login-name))
(load (concat user-emacs-directory "packages.el"))
(load (concat user-emacs-directory "config.el"))
(load (concat user-emacs-directory "keybind.el"))
(load (concat user-emacs-directory "appearance.el"))
;;(load (concat user-emacs-directory "mail.el"))
