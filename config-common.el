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

;; UTF-8 Encoding Setup
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)

;; Delete TABs the normal way
(setq backward-delete-char-untabify-method nil)

;; =============================================================================
;; Built-in Package Configurations
;; =============================================================================

;; Show column indicator
(use-package text-mode
  :ensure nil
  :hook (text-mode . display-fill-column-indicator-mode))

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

;; Command interpreter settings
(use-package comint
  :ensure nil
  :custom
  (comint-input-ignoredups t)
  :config
  (setq comint-move-point-for-output t
        comint-process-echoes t
        comint-prompt-read-only t
        comint-scroll-to-bottom-on-input t
        comint-scroll-to-bottom-on-output t
        comint-scroll-show-maximum-output t)
  (add-to-list 'comint-output-filter-functions #'ansi-color-process-output))


;; Xref settings
(defun my-xref-buffer-mode-hook ()
  (display-line-numbers-mode 1)
  (setq-local display-line-numbers-width 3)
  (setq-local display-line-numbers-extra-text-width 2))

(use-package xref
  :ensure nil
  :hook
  (xref--xref-buffer-mode . my-xref-buffer-mode-hook))

;; Which-key settings
(use-package which-key
  :ensure nil
  :init
  (which-key-mode 1))

;; CUA settings
(use-package cua-base
  :ensure nil
  :init
  (cua-mode 1)
  :custom
  (cua-auto-tabify-rectangles nil)
  (cua-keep-region-after-copy t)
  (cua-enable-cua-keys t))


;; =============================================================================
;; Ediff settings
;; =============================================================================

(use-package ediff
  :defer t
  :custom
  ;; Frame and window layout
  (ediff-window-setup-function 'ediff-setup-windows-plain)
  (ediff-split-window-function 'split-window-horizontally)

  ;; UI and display options
  (ediff-show-registry-before-ediff-regime nil)
  (ediff-highlight-all-current-diffs t)

  ;; Diff behavior
  (ediff-ignore-similar-regions t)
  (ediff-keep-variants nil)
  (ediff-show-ancestor t)

  :config
  ;; Restore previous layout upon exiting ediff
  (when (fboundp 'winner-mode)
    (winner-mode 1)
    (add-hook 'ediff-after-quit-hook-internal #'winner-undo)))


;; =============================================================================
;; IBuffer settings
;; =============================================================================

(defun my-ibuffer-mode-hook ()
  "Custom hook settings for Ibuffer."
  (setq ibuffer-expert t)
  (setq ibuffer-show-empty-filter-groups nil)
  (setq ibuffer-default-shrink-to-minimum-size nil)
  (setq ibuffer-use-other-window nil)
  (setq ibuffer-display-summary nil)
  (setq ibuffer-default-sorting-mode 'filename/process)
  (setq ibuffer-title-face 'font-lock-doc-face)
  (setq ibuffer-use-header-line t)
  (hl-line-mode 1)
  (ibuffer-switch-to-saved-filter-groups "default")
  (ibuffer-auto-mode 1))


(use-package ibuffer
  :ensure nil
  :hook
  (ibuffer-mode . my-ibuffer-mode-hook)

  :custom
  (ibuffer-saved-filter-groups
   '(("default"
      ("GDB"
       (or
        (mode . gud-mode)
        (mode . gud-tooltip-mode)
        (mode . gdb-breakpoints-mode)
        (mode . gdb-disassembly-mode)
        (mode . gdb-frames-mode)
        (mode . gdb-inferior-io-mode)
        (mode . gdb-locals-mode)
        (mode . gdb-memory-mode)
        (mode . gdb-registers-mode)
        (mode . gdb-script-mode)
        (mode . gdb-threads-mode)))
      ("Shell"
       (or
        (mode . shell-mode)
        (mode . term-mode)
        (mode . eshell-mode)
        (mode . eat-mode)))
      ("Mail"
       (or
        (mode . mu4e-main-mode)
        (mode . mu4e-headers-mode)
        (mode . mu4e-view-mode)
        (mode . mu4e-compose-mode)))
      ("C/C++"
       (or
        (mode . c-mode)
        (mode . c++-mode)))
      ("Python"
       (mode . python-mode))
      ("Lisp/Scheme"
       (or
        (mode . scheme-mode)
        (mode . lisp-mode)
        (mode . emacs-lisp-mode)))
      ("Script"
       (or
        (mode . sh-mode)
        (mode . shell-script-mode)))
      ("Text"
       (or
        (mode . text-mode)
        (mode . markdown-mode)
        (mode . rst-mode)))
      ("Magit"
       (derived-mode . magit-mode))))))
