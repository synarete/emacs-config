;;; config-common.el -- Common configuration -*- lexical-binding: t; -*-

;; Show emacs version on frame title
(defconst my-emacs-version
  (format "%d.%d" emacs-major-version emacs-minor-version))

(setq frame-title-format (format "Emacs %s" my-emacs-version))

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

;; Show only emacs version in scratch buffer
(setq initial-scratch-message (format ";; Emacs %s" my-emacs-version))

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

;; Isearch settings
(setq isearch-lazy-count t)

;; Prevent extraneous Tabs
(setq-default indent-tabs-mode nil)
