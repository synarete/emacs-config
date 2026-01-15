;;; keybind-common.el  -*- lexical-binding: t; -*-

;; Delete TABs the normal way
(setq backward-delete-char-untabify-method nil)

;; Yank with middle mouse
(setq mouse-yank-at-point t)

;; Window switching with ALT
(windmove-default-keybindings 'meta)
