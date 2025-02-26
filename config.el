;;; config.el -- User specific emacs configuration
(message "[ Configure emacs behaviour (user: %s) ]" (user-login-name))

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

;; New buffers are text mode by default
(setq default-major-mode 'text-mode)

;; UTF-8 by default
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)

;; Display buffer-size
(size-indication-mode)

;; Re-visit files at last place
(save-place-mode 1)

;; Revert buffers when underlying file changed
(global-auto-revert-mode t)

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

;; Improves mouse & scrolling
(setq scroll-conservatively 101)
(setq scroll-preserve-screen-position 1)
(setq mouse-wheel-follow-mouse t)

;; Simpler dired buffers
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(add-hook 'dired-mode-hook 'hl-line-mode)

;; Don't Lock Files
(setq-default create-lockfiles nil)

;; Compilation settings
(setq-default compilation-always-kill t)
(setq-default compilation-ask-about-save nil)
(setq-default compilation-scroll-output t)

;;; Programming configs

;; Prevent extraneous Tabs
(setq-default indent-tabs-mode nil)

;; Indent with TAB only at line's left margine
(setq tab-always-indent nil)

;; Display line numbers
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Display column numbers
(add-hook 'prog-mode-hook #'column-number-mode)

;; Remove trailing whitespaces upon save
(add-hook 'prog-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'delete-trailing-whitespace)
            (add-hook 'before-save-hook 'whitespace-cleanup)))

;; Show column-indicator at 80
(setq-default display-fill-column-indicator-column 80)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; Enable spell-checker for text and prog mode
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

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
  (setq c-basic-offset 8)
  (setq c-indent-level 8)
  (setq tab-width 8)
  (setq indent-tabs-mode t))

(add-to-list 'c-mode-common-hook 'my-c-mode-style)

;; Shell script style
;; See: https://google.github.io/styleguide/shellguide.html
(add-hook 'sh-mode-hook
          (lambda ()
            (setq sh-basic-offset 2)
            (setq sh-indentation 2)))

;;; Flymake
(require 'flymake)
(add-hook 'c-mode-hook 'flymake-mode)

;;; LSP
(add-hook 'c-mode-hook
          (lambda ()
            (setq lsp-auto-guess-root t)
            (setq lsp-log-io nil)
            (setq lsp-restart 'auto-restart)
            (setq lsp-enable-symbol-highlighting nil)
            (setq lsp-enable-on-type-formatting nil)
            (setq lsp-signature-auto-activate t)
            (setq lsp-signature-doc-lines 1)
            (setq lsp-signature-render-documentation nil)
            (setq lsp-eldoc-hook nil)
            (setq lsp-modeline-code-actions-enable nil)
            (setq lsp-modeline-diagnostics-enable nil)
            (setq lsp-headerline-breadcrumb-enable nil)
            (setq lsp-semantic-tokens-enable nil)
            (setq lsp-enable-folding nil)
            (setq lsp-enable-imenu nil)
            (setq lsp-enable-snippet nil)
            (setq read-process-output-max (* 1024 1024))
            (setq lsp-idle-delay 0.5)
            (setq lsp-clients-clangd-args
                  '("-j=1"
                    "--background-index"
                    "--completion-style=detailed"
                    "--header-insertion=never"
                    "--header-insertion-decorators=0"
                    "--all-scopes-completion"
                    "--suggest-missing-includes"))
            ))

(add-hook 'c-mode-hook
          (lambda ()
            (setq lsp-ui-doc-enable nil)
            (setq lsp-ui-doc-header t)
            (setq lsp-ui-doc-include-signature t)
            (setq lsp-ui-doc-border (face-foreground 'default))
            (setq lsp-ui-sideline-show-code-actions t)
            (setq lsp-ui-sideline-delay 0.1)))

;;; Debug with gdb
(require 'gud)
(setq gdb-show-main t)
(setq gdb-restore-window-configuration-after-quit t)
(setq gdb-many-windows t)

;;; IBuffer settings & layout
(require 'ibuffer)

(setq ibuffer-saved-filter-groups
      (quote
       (("default"
         ("Code" (or
                  (mode . c-mode)
                  (mode . c++-mode)
                  (mode . python-mode)
                  (mode . scheme-mode)
                  (mode . lisp-mode)
                  (mode . emacs-lisp-mode)))
         ("Shell" (mode . sh-mode))
         ("Text" (mode . text-mode))
         ("Term" (mode . term-mode))
         ("Magit" (name . "^magit"))
         ))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")
            (setq ibuffer-show-empty-filter-groups nil)
            (setq ibuffer-default-shrink-to-minimum-size nil)
            (setq ibuffer-use-other-window nil)
            (setq ibuffer-display-summary nil)
            (ibuffer-auto-mode 1)))
                        
            
