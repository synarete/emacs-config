;;;; LSP config
(require 'lsp-mode)

;; Preferred lsp key prefix
(setq lsp-keymap-prefix "C-l")

;; Define the key binding in lsp-mode-map
(define-key lsp-mode-map (kbd lsp-keymap-prefix) lsp-command-map)

;; Custom settings
(defun my-lsp-mode ()
  (setq lsp-auto-guess-root t)
  (setq lsp-log-io nil)
  (setq lsp-restart 'auto-restart)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-signature-auto-activate t)
  (setq lsp-signature-doc-lines 1)
  (setq lsp-signature-render-documentation nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-semantic-tokens-enable nil)
  (setq lsp-diagnostics-provider :none)
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
          "--suggest-missing-includes")))

(defun my-lsp-ui-mode ()
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-header t)
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-ui-doc-border (face-foreground 'default))
  (setq lsp-ui-doc-show-with-mouse nil)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-sideline-delay 0.1))

(add-hook 'c-mode-hook #'my-lsp-mode)
(add-hook 'c-mode-hook #'my-lsp-ui-mode)
(add-hook 'python-mode-hook #'my-lsp-mode)

;; Add the which-key integration
(require 'which-key)
(which-key-mode t)
(add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)

