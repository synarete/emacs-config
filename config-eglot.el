;;; config-eglot.el -- Eglot (LSP client) settings -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Eglot config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-eglot-setup-c-hook ()
  "Enable Eglot in C mode only if clangd is installed."
  (when (executable-find "clangd")
    (eglot-ensure)))

(defun my-eglot-setup-python-hook ()
  "Enable Eglot in Python mode only if pylsp is installed."
  (when (executable-find "pylsp")
    (eglot-ensure)))

(use-package eglot
  :ensure nil
  :init
  ;; Keep Eglot away from diagnostics and from the major mode's imenu
  (setq eglot-stay-out-of '(flymake imenu))

  :custom
  ;; Do not keep a log of the JSONRPC traffic with the server
  (eglot-events-buffer-config '(:size 0 :format full))
  (eglot-ignored-server-capabilities
   '(:documentHighlightProvider
     :documentOnTypeFormattingProvider
     :inlayHintProvider))

  :config
  (add-to-list 'eglot-server-programs
               '((c-mode c-ts-mode c++-mode c++-ts-mode)
                 . ("clangd"
                    "-j=1"
                    "--background-index"
                    "--completion-style=detailed"
                    "--header-insertion=never"
                    "--header-insertion-decorators=0"
                    "--all-scopes-completion")))

  :hook
  (c-mode . my-eglot-setup-c-hook)
  (c++-mode . my-eglot-setup-c-hook)
  (python-mode . my-eglot-setup-python-hook)

  :bind
  ;; Same key sequences as the default `lsp-mode' keymap
  (:map eglot-mode-map
        ("C-c l r r" . eglot-rename)
        ("C-c l r o" . eglot-code-action-organize-imports)
        ("C-c l g g" . xref-find-definitions)
        ("C-c l g r" . xref-find-references)
        ("C-c l g d" . eglot-find-declaration)
        ("C-c l g i" . eglot-find-implementation)
        ("C-c l g t" . eglot-find-typeDefinition)
        ("C-c l g a" . xref-find-apropos)
        ("C-c l a a" . eglot-code-actions)
        ("C-c l h h" . eldoc-doc-buffer)
        ("C-c l = =" . eglot-format-buffer)
        ("C-c l = r" . eglot-format)
        ("C-c l w r" . eglot-reconnect)
        ("C-c l w q" . eglot-shutdown)))

;; Show a single line of signature or hover info in the echo area; the full
;; documentation is available via `eldoc-doc-buffer' ("C-c l h h")
(setq eldoc-echo-area-use-multiline-p nil)
