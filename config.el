;;; config.el -- User specific configuration -*- lexical-binding: t; -*-

;; Common
(load (concat user-emacs-directory "config-common.el"))

;; IBuffer
(load (concat user-emacs-directory "config-ibuffer.el"))

;; Coding and text-mode
(load (concat user-emacs-directory "config-text.el"))

;; Prgoramming
(load (concat user-emacs-directory "config-prog.el"))

;; Debugging
(load (concat user-emacs-directory "config-gdb.el"))

;; LSP
(load (concat user-emacs-directory "config-lsp.el"))

;; Command-line interpreters
(load (concat user-emacs-directory "config-comint.el"))

;; Misc
(load (concat user-emacs-directory "config-misc.el"))

