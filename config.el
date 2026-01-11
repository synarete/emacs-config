;;; config.el -- User specific configuration -*- lexical-binding: t; -*-

;;;; Common configs

;; Dedicated custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Don't tell user when doing GC
(setq garbage-collection-messages nil)

;; Skip the startup screen
(setq-default inhibit-startup-screen t)

;; Do not create backup~ files
(setq make-backup-files nil)

;; Do not create #auto-save# files
(setq auto-save-default nil)

;; Only emacs version in scratch buffer
(setq initial-scratch-message
      (format ";; Emacs %d.%d" emacs-major-version emacs-minor-version))

;; Re-visit files at last place
(save-place-mode 1)

;; Revert buffers when underlying file changed
(global-auto-revert-mode t)

;; Disable version control
(setq vc-handled-backends nil)

;;; Behaviour configs

;; No beep
(setq visible-bell nil)

;; Disable annoying bell
(setq ring-bell-function 'ignore)

;; Prefer short y-or-n answers
(setopt use-short-answers t)

;; Prefer keyboard over dialog-box
(setq use-dialog-box nil)

;; Do not ask before saving buffers
(setq buffer-save-without-query 't)

;; Don't Lock Files
(setq-default create-lockfiles nil)

;; Kill active processes upon exit, without prompt
(setq confirm-kill-processes nil)

;; Default column-indicator at 80
(setq-default display-fill-column-indicator-column 80)

;; Improves mouse & scrolling
(setq scroll-conservatively 101)
(setq scroll-preserve-screen-position 1)
(setq scroll-margin 0)
(setq mouse-wheel-follow-mouse t)

;; Isearch settings
(setq isearch-lazy-count t)

;; Use ido
(require 'ido)
(ido-mode t)

;;;; Programming configs

;; Prevent extraneous Tabs
(setq-default indent-tabs-mode nil)

;; Display line numbers
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Display column numbers
(add-hook 'prog-mode-hook #'column-number-mode)

;; Remove trailing whitespaces upon save
(defun my-prog-mode-save ()
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (add-hook 'before-save-hook 'whitespace-cleanup))

(add-hook 'prog-mode-hook #'my-prog-mode-save)

;; Show column-indicator at 80
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; Enable spell-checker in prog mode
(add-hook 'prog-mode-hook #'flyspell-prog-mode)

;; Prefered coding-style
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

;;;; Compilation settings
(setq-default compilation-always-kill t)
(setq-default compilation-ask-about-save nil)
(setq-default compilation-scroll-output 'first-error)

;;;; Flymake
(require 'flymake)
(add-hook 'c-mode-hook #'flymake-mode)


;; Coding and text-mode 
(load (concat user-emacs-directory "config-text.el"))

;; IBuffer
(load (concat user-emacs-directory "config-ibuffer.el"))

;; Debugging
(load (concat user-emacs-directory "config-gdb.el"))

;; LSP
(load (concat user-emacs-directory "config-lsp.el"))

;; Command-line interpreters 
(load (concat user-emacs-directory "config-comint.el"))
