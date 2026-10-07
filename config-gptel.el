;;; config-gptel.el -- LLMs configuration -*- lexical-binding: t; -*-

(require 'gptel)

(defun my-anthropic-api-key ()
  (getenv "ANTHROPIC_API_KEY"))

(defvar my-claude-backend
  (gptel-make-anthropic "Claude" :stream t :key #'my-anthropic-api-key))

(setq-default gptel-backend my-claude-backend)

;; Default model
(setq-default gptel-model 'claude-sonnet-5)

;; Add a dedicated C coding directive
(add-to-list 'gptel-directives
             '(c-expert . "You are an expert C developer.
Provide clean, POSIX-compliant C23 code. Focus on memory safety, null-pointer
checks, avoiding buffer overflows, and clear error handling."
                        ))
