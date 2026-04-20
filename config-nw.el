;;; config-nw.el -- Non-window (term) configs -*- lexical-binding: t; -*-

;; Tell terminal to wait until the entire screen is ready before drawing
(set-terminal-parameter nil 'xterm-copy-mode t)

;; Don't update the display if there's pending input
(setq redisplay-dont-pause nil)

;; Use "lazy" fontification during heavy output
(setq jit-lock-defer-time 0.05)

;; No need to have time in mode-line
(setq display-time-mode nil)
