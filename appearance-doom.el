;;; appearance-doom.el  -*- lexical-binding: t; -*-

;;;; Mode-line
(setq doom-modeline-bar-width 0)
(setq doom-modeline-buffer-file-name-style 'relative-to-project)
(setq doom-modeline-icon nil)
(setq doom-modeline-major-mode-icon nil)
(setq doom-modeline-time-icon nil)
(setq doom-modeline-time-live-icon nil)
(setq doom-modeline-battery nil)
(setq doom-modeline-env-version nil)
(doom-modeline-mode 1)

;;;; Theme
;; Prefer darker theme
(load-theme 'doom-opera t)
