;;; config-gmail.el -- mu4e settings (gmail) -*- lexical-binding: t; -*-

(require 'mu4e)

;; Resolve Mail dir relative to user home directory dynamically
(setq mu4e-maildir
      (expand-file-name "Mail" (getenv "HOME"))
      mu4e-get-mail-command "offlineimap"
      mu4e-update-interval 300) ; Auto-sync every 5 minutes

;; Sending Mail via msmtp
(setq send-mail-function 'sendmail-send-it
      sendmail-program (executable-find "msmtp")
      mail-specify-envelope-from t
      mail-envelope-from 'header)

;; User Details
(setq user-full-name "Shachar Sharon"
      user-mail-address "synarete@gmail.com")

;; Gmail Folder Mappings
(setq mu4e-drafts-folder "/[Gmail]/Drafts"
      mu4e-sent-folder   "/[Gmail]/Sent Mail"
      mu4e-trash-folder  "/[Gmail]/Trash"
      mu4e-refile-folder "/[Gmail]/All Mail")


;;; Allow Gmail trash-delete via single key

;; Marked actions apply immediately without extra prompt when executing ('x')
(setq mu4e-headers-confirm-2-marks nil)

;; Prevent Gmail IMAP duplicate issues
(setq mu4e-trash-without-flag t)

;; Show context header indicators cleanly
(setq mu4e-headers-leave-behavior 'apply)
