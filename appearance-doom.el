;;; appearance-doom.el  -*- lexical-binding: t; -*-

;;;; Mode-line
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-bar-width 0)
  (doom-modeline-buffer-file-name-style 'relative-to-project)
  (doom-modeline-icon nil)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-time-icon nil)
  (doom-modeline-time-live-icon nil)
  (doom-modeline-battery nil)
  (doom-modeline-env-version nil)
  :custom-face
  (mode-line ((t (:slant normal))))
  (mode-line-inactive ((t (:slant normal))))
  (doom-modeline ((t (:slant normal)))))

;;;; Theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-opera t))

