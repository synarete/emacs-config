;;; config.el -- User specific emacs configuration
(message "[ Configure emacs behaviour for %s ]" (user-login-name))


;;; Common configs

;; Highlight matching parantheses when the point is on them
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Highlight the marked region.
(setq-default transient-mark-mode t)

;; Highlight text selection
(transient-mark-mode 1)

;; Highligh current line unless in term-mode
(add-hook 'after-change-major-mode-hook
          (lambda ()
            (hl-line-mode
             (if (equal major-mode 'term-mode) 0 1))))

;; Display buffer-size
(size-indication-mode)

;; New buffers are text mode by default
(setq default-major-mode 'text-mode)


;;; Behaviour configs

;; Do not ask before saving buffers
(setq buffer-save-without-query 't)

;; Disable annoying bell
(setq ring-bell-function 'ignore)

;; Improves mouse & scrolling
(setq scroll-conservatively 101)
(setq scroll-preserve-screen-position 1)
(setq mouse-wheel-follow-mouse t)

;; Simpler dired buffers
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(add-hook 'dired-mode-hook 'hl-line-mode)

;; Auto-refresh ibuffer
(setq ibuffer-mode-hook '(ibuffer-auto-mode))

;; Don't Lock Files
(setq-default create-lockfiles nil)

;; Compilation settings
(setq-default compilation-always-kill t)
(setq-default compilation-ask-about-save nil)
(setq-default compilation-scroll-output t)


;;; Programming configs

;; Prevent extraneous Tabs
(setq-default indent-tabs-mode nil)

;; Let major mode decide on how to indent with TAB
(setq tab-always-indent 'complete)

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

;; Display whitespaces when editing code
(require 'whitespace)
(add-hook 'prog-mode-hook
          (lambda ()
            (setq whitespace-style '(face empty tab-mark trailing lines-tail))
            (setq show-trailing-whitespace t)
            (add-hook 'prog-mode-hook 'whitespace-mode)))

;; Prefered coding-style
(setq c-default-style
      '((cc-mode . "linux")
        (python-mode . "python")
        (awk-mode . "awk")
        (java-mode . "java")
        (other . "gnu")))

(add-to-list 'c-mode-common-hook
             (lambda ()
               (setq c-basic-offset 8)
               (setq c-indent-level 8)
               (setq tab-width 8)
               (setq indent-tabs-mode t)
               (setq c-syntactic-indentation nil)))

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
            (setq lsp-signature-auto-activate nil)
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
            (setq lsp-idle-delay 0.5)))

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
;; (setq gdb-many-windows t)
