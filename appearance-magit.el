;;; appearance-magit.el  -*- lexical-binding: t; -*-

(require 'magit)
(defun my-magit-style ()
  (dolist
      (face '(;; Inactive (dim) sections
              magit-diff-added
              magit-diff-removed
              magit-diff-context
              magit-diff-base
              ;; Active (highlighted) sections
              magit-diff-added-highlight
              magit-diff-removed-highlight
              magit-diff-context-highlight
              magit-diff-base-highlight
              ;; General section headers
              magit-section-highlight))
    (set-face-attribute face nil :background 'unspecified)))

(with-eval-after-load 'magit
  (my-magit-style))
