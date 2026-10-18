;;; config-treemacs.el -- Treemacs configuration -*- lexical-binding: t; -*-

(use-package treemacs
  :ensure t
  :custom
  (treemacs-no-png-images t)
  (treemacs-indentation 1)
  (treemacs-follow-after-init t)
  (treemacs-recenter-after-file-follow nil)
  (treemacs-silent-refresh t)
  (treemacs-silent-filewatch t)
  (treemacs-show-hidden-files t)
  (treemacs-never-persist t)
  (treemacs--width-is-locked nil)
  (treemacs-width-is-initially-locked nil)
  :config
  (set-face-attribute 'treemacs-root-face nil :height 1.0)
  :bind
  (:map treemacs-mode-map
        ([mouse-3] . nil)
        ([down-mouse-3] . nil)))

