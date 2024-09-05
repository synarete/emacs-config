;;; start.el -- Custom Emacs settings
(message "[ Start emacs (user: %s) ]" (user-login-name))

;; Speedup boot
(setq package-enable-at-startup nil)

;; Don't tell user when doing GC
(setq garbage-collection-messages nil)

