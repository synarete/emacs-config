;;; config-lsp.el -- LSP settings -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LSP config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-lsp-setup-c-hook ()
  "Enable LSP in C mode only if clangd is installed."
  (when (executable-find "clangd")
    (lsp-deferred)))

(defun my-lsp-setup-python-hook ()
  "Enable LSP in Python mode only if pylsp is installed."
  (when (executable-find "pylsp")
    (lsp-deferred)))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")

  :custom
  (lsp-auto-guess-root t)
  (lsp-log-io nil)
  (lsp-restart 'auto-restart)
  (lsp-enable-symbol-highlighting nil)
  (lsp-enable-on-type-formatting nil)
  (lsp-signature-auto-activate '(:on-trigger-char :on-server-request))
  (lsp-signature-render-documentation nil)
  (lsp-modeline-code-actions-enable nil)
  (lsp-modeline-diagnostics-enable nil)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-semantic-tokens-enable nil)
  (lsp-diagnostics-provider :none)
  (lsp-enable-folding nil)
  (lsp-enable-imenu nil)
  (lsp-enable-snippet nil)
  (lsp-idle-delay 0.5)
  (lsp-clients-clangd-args
   '("-j=1"
     "--background-index"
     "--completion-style=detailed"
     "--header-insertion=never"
     "--header-insertion-decorators=0"
     "--all-scopes-completion"))

  :hook
  (c-mode . my-lsp-setup-c-hook)
  (c++-mode . my-lsp-setup-c-hook)
  (python-mode . my-lsp-setup-python-hook)
  (lsp-mode . lsp-enable-which-key-integration))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-sideline-enable nil))
