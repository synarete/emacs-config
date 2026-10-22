;;; config-common.el -- Common configuration -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs 30.2 and above
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Show emacs version on frame title and scratch buffer
(defconst my-emacs-version
  (format "%d.%d" emacs-major-version emacs-minor-version))

(setq frame-title-format (format "Emacs %s" my-emacs-version))
(setq initial-scratch-message (format ";; Emacs %s" my-emacs-version))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General Setup & Environment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; Mouse wheel scrolls
(setopt mouse-wheel-follow-mouse t)

;; Yank with middle mouse
(setopt mouse-yank-at-point t)

;; Window-divider
(setopt window-divider-default-places t)
(setopt window-divider-default-bottom-width 1)
(setopt window-divider-default-right-width 1)
(window-divider-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Built-in Package Configurations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; Flymake
(use-package flymake
  :ensure nil
  :hook (c-mode . flymake-mode))

;; Windmove
(use-package windmove
  :ensure nil
  :config
  (windmove-default-keybindings 'meta)
  (setq windmove-wrap-around t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Programming mode settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Display line numbers, column numbers, and column indicator
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'column-number-mode)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

(defun my-prog-mode-save-hook ()
  "Remove trailing whitespaces upon save."
  (add-hook 'before-save-hook #'delete-trailing-whitespace nil t)
  (add-hook 'before-save-hook #'whitespace-cleanup nil t))

(add-hook 'prog-mode-hook #'my-prog-mode-save-hook)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; White-spaces in prog-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-apply-whitespace-faces (&rest _)
  "Apply subtle whitespace face overrides over the active theme."
  (set-face-attribute 'whitespace-tab nil
                      :background 'unspecified
                      :foreground "gray19")
  (set-face-attribute 'whitespace-space nil
                      :background 'unspecified
                      :foreground "gray19")
  (set-face-attribute 'whitespace-space-after-tab nil
                      :background 'unspecified
                      :foreground "gray19"))

;; Re-apply faces whenever any theme (like doom-theme) is loaded
(add-hook 'enable-theme-functions #'my-apply-whitespace-faces)

;; Apply immediately for the currently loaded theme
(my-apply-whitespace-faces)

(defun my-whitespace-style-hook ()
  "Configure subtle whitespace visualization for programming modes."
  (setq-local whitespace-style '(face trailing tabs tab-mark))
  (setq-local whitespace-display-mappings
              '((tab-mark 9 [187 9] [92 9])))
  (whitespace-mode 1))

(add-hook 'prog-mode-hook #'my-whitespace-style-hook)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C Development
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-c-mode-style-hook ()
  "Apply custom style and indentation rules for C/C++ modes."
  (c-set-style "linux")
  (setq-local c-indent-level 8)
  (setq-local tab-always-indent t)
  (setq-local tab-width 8))

(defun my-c23-keywords-hook ()
  "Add C23 keywords and types to font-lock for C mode."
  (let ((c23-kw (regexp-opt
                 '("alignas"
                   "alignof"
                   "bool"
                   "constexpr"
                   "false"
                   "nullptr"
                   "static_assert"
                   "thread_local"
                   "true"
                   "typeof"
                   "typeof_unqual")
                 'symbols))
        (c23-tp (regexp-opt
                 '("_BitInt"
                   "_Decimal32"
                   "_Decimal64"
                   "_Decimal128")
                 'symbols)))
    (font-lock-add-keywords nil
                            `((,c23-kw . font-lock-keyword-face)
                              (,c23-tp . font-lock-type-face)))))

(use-package cc-mode
  :ensure nil
  :custom
  (c-default-style
   '((cc-mode . "linux")
     (python-mode . "python")
     (awk-mode . "awk")
     (java-mode . "java")
     (other . "gnu")))
  :hook
  ((c-mode-common . my-c-mode-style-hook)
   (c-mode . my-c23-keywords-hook)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Shell-script settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-sh-mode-style-hook ()
  (setq-local tab-width 8)
  (setq-local tab-always-indent t)
  (setq-local indent-tabs-mode t))

(use-package sh-script
  :ensure nil
  :custom
  (sh-basic-offset 8)
  (sh-indent-after-continuation 'always)
  :hook
  (sh-mode . my-sh-mode-style-hook))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Xref settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-xref-buffer-mode-hook ()
  (display-line-numbers-mode 1)
  (setq-local display-line-numbers-width 3)
  (setq-local display-line-numbers-extra-text-width 2))

(use-package xref
  :ensure nil
  :hook
  (xref--xref-buffer-mode . my-xref-buffer-mode-hook))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Isearch settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-isearch-region-or-forward ()
  "Search for the active region, or start a normal search if none is active."
  (interactive)
  (if (region-active-p)
      (let ((region-text
             (buffer-substring-no-properties (region-beginning) (region-end))))
        (deactivate-mark)
        (isearch-mode t)
        (isearch-process-search-string region-text region-text))
    (isearch-forward)))

(use-package isearch
  :ensure nil
  :custom
  (isearch-lazy-count t)

  :bind
  ("C-f" . isearch-forward-thing-at-point)
  ("C-s" . my-isearch-region-or-forward)
  (:map isearch-mode-map
        ("C-f" . isearch-repeat-forward)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ediff settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command interpreter settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Compile settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-compile-make ()
  "Compile with `make` in the current projectile project."
  (interactive)
  (when-let ((root (projectile-acquire-root)))
    (let* ((num-cpus (max 1 (1- (num-processors))))
           (jobs (max 1 num-cpus))
           (make-cmd (format "make -j%d" jobs)))
      (projectile-with-default-dir root
        (compile make-cmd)))))

(defun my-compile-make-clean ()
  "Compile-clean with `make` in the current projectile project."
  (interactive)
  (when-let ((root (projectile-acquire-root)))
    (projectile-with-default-dir root
      (compile "make clean"))))

(use-package compile
  :ensure nil
  :custom
  (compilation-always-kill t)
  (compilation-ask-about-save nil)
  (compilation-scroll-output 'first-error)
  :bind
  ("<f3>"   . my-compile-make)
  ("C-<f3>" . my-compile-make-clean))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GDB/GUD settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-gdb-mode-hook ()
  "Add extra space before line-number for GDB pos indicator."
  (setq-local display-line-numbers-width 5))

(defun my-gdb ()
  "Launch GDB from the current project root directory."
  (interactive)
  (let ((default-directory
         (if-let ((proj (project-current)))
             (project-root proj)
           default-directory)))
    (call-interactively #'gdb)))

(use-package gdb-mi
  :ensure nil
  :defer t
  :custom
  (gdb-show-main t)
  (gdb-display-io-nopopup t)
  (gdb-non-stop-setting nil)
  (gdb-restore-window-configuration-after-quit t)
  (gdb-many-windows nil)

  :hook
  (gdb-mode . my-gdb-mode-hook)

  :bind
  (:map gud-mode-map
        ("<up>"   . comint-previous-input)
        ("<down>" . comint-next-input))
  (:map gud-minor-mode-map
        ("<f5>" . gud-next)
        ("<f6>" . gud-step)
        ("<f7>" . gud-finish)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IBuffer settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(defun my-toggle-ibuffer ()
  "Toggle the ibuffer display."
  (interactive)
  (if (derived-mode-p 'ibuffer-mode)
      (quit-window)
    (ibuffer)))

(use-package ibuffer
  :ensure nil
  :hook
  (ibuffer-mode . my-ibuffer-mode-hook)

  :bind
  ("<f2>" . my-toggle-ibuffer)

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
