;;; config-text.el -- Text-mode settings -*- lexical-binding: t; -*-

;;;; Coding and text-mode

;; UTF-8 by default
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)

;; Show default column-indicator (80) in text-mode
(add-hook 'text-mode-hook #'display-fill-column-indicator-mode)

;; Enable spell-checker in text mode
(require 'flyspell)
(add-hook 'text-mode-hook #'flyspell-mode)
