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

;; Prevent extraneous Tabs
(setq-default indent-tabs-mode nil)

;; Use ido
(require 'ido)
(ido-mode t)

;; IBuffer
(load (concat user-emacs-directory "config-ibuffer.el"))

;; Coding and text-mode
(load (concat user-emacs-directory "config-text.el"))

;; Prgoramming
(load (concat user-emacs-directory "config-prog.el"))

;; Debugging
(load (concat user-emacs-directory "config-gdb.el"))

;; LSP
(load (concat user-emacs-directory "config-lsp.el"))

;; Command-line interpreters
(load (concat user-emacs-directory "config-comint.el"))
