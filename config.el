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

;; Highligh current line
(global-hl-line-mode 1)

;; Display buffer-size
(setq-default size-indication-mode 't)

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
(setq pixel-scroll-precision-use-momentum t)

;;; Programming configs
(require 'cc-mode)
(require 'make-mode)

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
