;;; config-misc.el  -*- lexical-binding: t; -*-

;; Improve mouse & scrolling
(when (display-graphic-p)
  (setq scroll-conservatively 101)
  (setq scroll-preserve-screen-position 1)
  (setq scroll-margin 0)
  (setq mouse-wheel-follow-mouse t))
