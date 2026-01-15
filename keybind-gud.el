;;; keybind-gud.el -- Debug key-binding  -*- lexical-binding: t; -*-

(require 'gud)
(define-key gud-mode-map (kbd "<up>") #'comint-previous-input)
(define-key gud-mode-map (kbd "<down>") #'comint-next-input)
(define-key gud-minor-mode-map (kbd "<f5>") #'gud-next)
(define-key gud-minor-mode-map (kbd "<f6>") #'gud-step)
(define-key gud-minor-mode-map (kbd "<f7>") #'gud-finish)
