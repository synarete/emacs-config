;;; config-common.el -- Common configuration -*- lexical-binding: t; -*-

;; =============================================================================
;; General Setup & Environment
;; =============================================================================

;; Show emacs version on frame title and scratch buffer
(defconst my-emacs-version
  (format "%d.%d" emacs-major-version emacs-minor-version))

(setq frame-title-format (format "Emacs %s" my-emacs-version))
(setq initial-scratch-message (format ";; Emacs %s" my-emacs-version))

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

;; Don't lock files
(setq-default create-lockfiles nil)

;; Disable version control
(setq vc-handled-backends nil)

;; Do not ask before saving buffers
(setq buffer-save-without-query t)

;; Kill active processes upon exit, without prompt
(setq confirm-kill-processes nil)

;; Performance & Display tweaks
(setq redisplay-skip-fontification-on-input t)
(setq-default display-fill-column-indicator-column 80)
(setopt indent-tabs-mode nil)

;; UI & Interaction
(setopt visible-bell nil)
(setopt ring-bell-function 'ignore)
(setopt use-short-answers t)
(setopt use-dialog-box nil)

;; Improved scrolling
(setopt scroll-conservatively 101)
(setopt scroll-preserve-screen-position 1)
(setopt scroll-margin 0)


;; =============================================================================
;; Built-in Package Configurations
;; =============================================================================

;; Re-visit files at last place
(use-package saveplace
  :ensure nil
  :init
  (save-place-mode 1))

;; Revert buffers when underlying file changed
(use-package autorevert
  :ensure nil
  :init
  (global-auto-revert-mode 1))

;; Open file-at-point without asking for confirmation if path exists
(use-package ffap
  :ensure nil
  :custom
  (ffap-no-confirm t))

;; Isearch settings
(use-package isearch
  :ensure nil
  :custom
  (isearch-lazy-count t))
