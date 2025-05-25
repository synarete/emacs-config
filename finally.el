;;; after-init.el --- Post start-up settings -*- lexical-binding: t; -*-
(message "[ After init setting (user: %s) ]" (user-login-name))

;; Revert to normal garbage collection settings
(setq gc-cons-threshold (* 8 1024 1024))
(setq gc-cons-percentage 0.1)
