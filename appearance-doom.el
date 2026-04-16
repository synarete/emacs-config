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

;; Disable italic fonts in modeline
(with-eval-after-load 'doom-modeline
  (set-face-attribute 'mode-line nil :slant 'normal)
  (set-face-attribute 'mode-line-inactive nil :slant 'normal)
  (set-face-attribute 'doom-modeline nil :slant 'normal))

(doom-modeline-mode 1)

;;;; Theme
;; Prefer darker theme
(condition-case err
    (load-theme 'doom-opera t)
  (error (message "Failed to load theme: %s" (error-message-string err))))
