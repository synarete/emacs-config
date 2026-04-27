;;; config-lsp.el -- LSP settings -*- lexical-binding: t; -*-

;;;; LSP config
(require 'lsp-mode)
(require 'lsp-ui)

;; Preferred lsp key prefix
(setq lsp-keymap-prefix "C-l")

;; Define the key binding in lsp-mode-map
(define-key lsp-mode-map (kbd lsp-keymap-prefix) lsp-command-map)

;; LSP settings
(defconst my-lsp-clients-clangd-args
  '("-j=1"
    "--background-index"
    "--completion-style=detailed"
    "--header-insertion=never"
    "--header-insertion-decorators=0"
    "--all-scopes-completion"
    "--suggest-missing-includes"))

(defun my-lsp-mode ()
  (setq-local lsp-auto-guess-root t)
  (setq-local lsp-log-io nil)
  (setq-local lsp-restart 'auto-restart)
  (setq-local lsp-enable-symbol-highlighting nil)
  (setq-local lsp-enable-on-type-formatting nil)
  (setq-local lsp-signature-auto-activate t)
  (setq-local lsp-signature-doc-lines 1)
  (setq-local lsp-signature-render-documentation nil)
  (setq-local lsp-modeline-code-actions-enable nil)
  (setq-local lsp-modeline-diagnostics-enable nil)
  (setq-local lsp-headerline-breadcrumb-enable nil)
  (setq-local lsp-semantic-tokens-enable nil)
  (setq-local lsp-diagnostics-provider :none)
  (setq-local lsp-enable-folding nil)
  (setq-local lsp-enable-imenu nil)
  (setq-local lsp-enable-snippet nil)
  (setq-local read-process-output-max (* 4 1024 1024))
  (setq-local lsp-idle-delay 0.5)
  (setq-local lsp-clients-clangd-args my-lsp-clients-clangd-args))

;; LSP-UI settings
(defun my-lsp-ui-mode ()
  (setq-local lsp-ui-doc-enable nil)
  (setq-local lsp-ui-doc-header t)
  (setq-local lsp-ui-doc-include-signature t)
  (setq-local lsp-ui-doc-border (face-foreground 'default))
  (setq-local lsp-ui-doc-show-with-mouse nil)
  (setq-local lsp-ui-sideline-enable nil)
  (setq-local lsp-ui-sideline-show-code-actions t)
  (setq-local lsp-ui-sideline-delay 0.1))

(defun my-lsp-setup-c ()
  "Enable LSP in C mode only if clangd is installed."
  (when (executable-find "clangd")
    (my-lsp-mode)
    (my-lsp-ui-mode)
    (lsp-deferred)))

(defun my-lsp-setup-python ()
  "Enable LSP in Python mode only if pylsp or pyright are installed."
  (when (or (executable-find "pylsp") (executable-find "pyright"))
    (my-lsp-mode)
    (my-lsp-ui-mode)
    (lsp-deferred)))

(add-hook 'c-mode-hook #'my-lsp-setup-c)
(add-hook 'python-mode-hook #'my-lsp-setup-python)

;; Add the which-key integration
(require 'which-key)
(which-key-mode t)
(add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
