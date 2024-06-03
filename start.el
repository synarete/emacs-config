;;; start.el -- Custom Emacs settings
(message "[ Start emacs for %s ]" (user-login-name))

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

;; Tell user when doing GC
(setq garbage-collection-messages t)

;; Use UTF-8 by default
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)

;; revent resize window on startup
(setq frame-inhibit-implied-resize t)
(setq default-frame-alist '((width . 120) (height . 42)))

;; Do rest of init flow from:
(load (concat user-emacs-directory "packages.el"))
(load (concat user-emacs-directory "config.el"))
(load (concat user-emacs-directory "keybind.el"))
(load (concat user-emacs-directory "appearance.el"))

