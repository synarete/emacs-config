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
  ;; Stay connected when xref jumps out of the project (e.g. system headers)
  (eglot-extend-to-xref t)
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
  (:map eglot-mode-map
        ("C-c r"  . eglot-rename)
        ("C-M-\\" . eglot-format)
        ("M-RET"  . eglot-code-actions)))

;; Show a single line of signature or hover info in the echo area; the full
;; documentation is available via `eldoc-doc-buffer' ("C-h .")
(setq eldoc-echo-area-use-multiline-p nil)
