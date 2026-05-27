;;; config-nw.el -- Non-window (term) configs -*- lexical-binding: t; -*-

;; Use "lazy" fontification during heavy output
(setq jit-lock-defer-time 0.05)

;; No need to have time in mode-line
(setq display-time-mode nil)

;; Try to have GUI-like colors
(setq termguicolors t)

;; No pixelwise in terminal
(setopt frame-resize-pixelwise nil)

;; Reduce ESC/Meta delay in terminal
(setopt echo-keystrokes 0.02)
(setopt idle-update-delay 0.2)
(setopt default-input-method nil)
