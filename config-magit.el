;;; config-magit.el -- Magit settings -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Magit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-git-commit-mode-hook ()
  "Wrap commit message body at 72 columns."
  (setq-local fill-column 72))

(use-package magit
  :ensure t

  :hook
  (git-commit-mode . my-git-commit-mode-hook)

  :bind
  (("C-c g"   . magit-status)
   ("C-c M-g" . magit-file-dispatch))

  :custom
  (magit-git-executable (or (executable-find "git") "git"))
  (magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  (magit-bury-buffer-function #'magit-restore-window-configuration)
  (magit-save-repository-buffers 'dontask)
  (magit-diff-refine-hunk 'all)
  (git-commit-summary-max-length 50)
  (git-commit-style-convention-checks
   '(non-empty-second-line overlong-summary-line))
  (magit-ediff-dwim-show-on-hunks t)
  (magit-section-initial-visibility-alist
   '((stashes . hide) (untracked . show) (unpushed . show)))

  :custom-face
  (magit-diff-added
   ((t (:foreground "#4e9a06" :background unspecified))))
  (magit-diff-removed
   ((t (:foreground "#cc0000" :background unspecified))))
  (magit-diff-context
   ((t (:foreground unspecified :background unspecified))))
  (magit-diff-base
   ((t (:foreground unspecified :background unspecified))))
  (magit-diff-added-highlight
   ((t (:foreground "#4e9a06" :background unspecified))))
  (magit-diff-removed-highlight
   ((t (:foreground "#cc0000" :background unspecified))))
  (magit-diff-context-highlight
   ((t (:foreground unspecified :background unspecified))))
  (magit-diff-base-highlight
   ((t (:foreground unspecified :background unspecified))))
  (magit-diff-file-heading
   ((t (:foreground unspecified :weight bold))))
  (magit-diff-file-heading-highlight
   ((t (:foreground unspecified :weight bold))))
  (magit-diff-hunk-heading
   ((t (:foreground "#06989a" :background unspecified))))
  (magit-diff-hunk-heading-highlight
   ((t (:foreground "#06989a" :background unspecified))))
  (magit-diff-whitespace-warning
   ((t (:background "#cc0000"))))
  (magit-hash
   ((t (:foreground "#c4a000"))))
  (magit-section-highlight
   ((t (:background unspecified))))
  (diff-refine-added
   ((t (:foreground "#8ae234" :background unspecified
                    :inverse-video nil :weight bold))))
  (diff-refine-removed
   ((t (:foreground "#ef2929" :background unspecified
                    :inverse-video nil :weight bold)))))
