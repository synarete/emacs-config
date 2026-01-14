;;; config-treemacs.el -- Treemacs configuration -*- lexical-binding: t; -*-

(require 'treemacs)

;; Use simple text only
(setq treemacs-no-png-images t)

;; Sane treemacs settings
(setq treemacs-indentation 1)
(setq treemacs-follow-after-init t)
(setq treemacs-recenter-after-file-follow nil)
(setq treemacs-silent-refresh t)
(setq treemacs-silent-filewatch t)
(setq treemacs-show-hidden-files t)
(setq treemacs-never-persist t)

;; Use normal face for treemacs root
(custom-set-faces
 '(treemacs-root-face ((t (:height 1.0)))))

;; Start with treemacs open
(treemacs-select-window)
