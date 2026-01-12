;;; config-prog.el -- Programming settings -*- lexical-binding: t; -*-

;;;; Programming configs

;; Display line numbers
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Display column numbers
(add-hook 'prog-mode-hook #'column-number-mode)

;; Display column-indicator (default: 80)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; Remove trailing whitespaces upon save
(defun my-prog-mode-save ()
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (add-hook 'before-save-hook 'whitespace-cleanup))

(add-hook 'prog-mode-hook #'my-prog-mode-save)

;; Coding-style
(setq c-default-style
      '((cc-mode . "linux")
        (python-mode . "python")
        (awk-mode . "awk")
        (java-mode . "java")
        (other . "gnu")))

;; C style
(defun my-c-mode-style ()
  (c-set-style "linux")
  (setq-local c-indent-level 8)
  (setq-local tab-always-indent t)
  (setq-local tab-width 8))

(add-to-list 'c-mode-common-hook #'my-c-mode-style)

;; Shell script style (following Linux kernel convention).
(defun my-sh-mode-style ()
  (setq-local tab-width 8)
  (setq-local tab-always-indent t)
  (setq-local sh-basic-offset 8)
  (setq-local sh-indent-after-continuation 'always)
  (setq-local indent-tabs-mode t))

(add-hook 'sh-mode-hook #'my-sh-mode-style)

;; Enable spell-checker in prog mode
(require 'flyspell)
(add-hook 'prog-mode-hook #'flyspell-prog-mode)

;;;; Flymake
(require 'flymake)
(add-hook 'c-mode-hook #'flymake-mode)

;;;; Compilation settings
(setq-default compilation-always-kill t)
(setq-default compilation-ask-about-save nil)
(setq-default compilation-scroll-output 'first-error)
