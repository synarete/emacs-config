;;; start.el -- Custom Emacs settings
(message "[ Start emacs (user: %s) ]" (user-login-name))

;; Load the custom file if it exists early on
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file (file-exists-p custom-file))
  (load custom-file nil :nomessage))

;; Skip the startup screen
(setq-default inhibit-startup-screen t)

;; Do not create backup~ files
(setq make-backup-files nil)

;; Do not create #auto-save# files
(setq auto-save-default nil)

;; Speedup boot
(setq package-enable-at-startup nil)

;; Prefer short y-or-n answers
(setopt use-short-answers t)

;; Don't tell user when doing GC
(setq garbage-collection-messages nil)

;; Use UTF-8 by default
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
