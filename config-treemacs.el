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
(setq treemacs-persist-process nil)

;; Use normal face for treemacs root
(set-face-attribute 'treemacs-root-face nil :height 1.0)

;; Disable mouse right-click on treemacs
(with-eval-after-load 'treemacs
  (define-key treemacs-mode-map [mouse-3] nil)
  (define-key treemacs-mode-map [down-mouse-3] nil))
