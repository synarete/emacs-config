;;; start.el -- Custom Emacs settings
(message "[ Start emacs (user: %s) ]" (user-login-name))

;; Load the custom file if it exists early on
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file (file-exists-p custom-file))
  (load custom-file nil :nomessage))

;; Speedup boot
(setq package-enable-at-startup nil)

;; Prefer short y-or-n answers
(setopt use-short-answers t)

;; Don't tell user when doing GC
(setq garbage-collection-messages nil)

