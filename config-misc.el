;;; config-misc.el  -*- lexical-binding: t; -*-

;; Mouse settings
(when (display-graphic-p)
  (setq mouse-wheel-follow-mouse t))

;; Use ido
(require 'ido)
(ido-mode t)
