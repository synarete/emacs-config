;;; email.el -- Use emacs as E-mail client
(message "[ Setup mail client (user: %s) ]" (user-login-name))

;;;; General mail settings
(setq user-mail-address "synarete@gmail.com")
(setq user-full-name "Shachar Sharon")

(setq message-send-mail-function 'smtpmail-send-it)

;; Spell checker for out-going messages
(add-hook 'message-send-hook 'ispell-message)

;;;; SMTP settings for Gmail
(setq smtpmail-default-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-service 587)
(setq smtpmail-starttls-credentials 
      '(("smtp.gmail.com" 587 nil nil)))
(setq smtpmail-auth-credentials
      '(("smtp.gmail.com" 587 "synarete@gmail.com" nil)))
(setq smtpmail-stream-type 'starttls)

;;;; MU4E
(require 'mu4e)

;; Mail folders:
(setq mu4e-drafts-folder "/Drafts")
(setq mu4e-sent-folder   "/Sent")
(setq mu4e-trash-folder  "/Trash")

;; Get gmail emails with mbsync
(setq mu4e-get-mail-command "mbsync --config ~/.emacs.d/.mbsyncrc gmail")

;; How to handle html-formatted emails
(setq mu4e-html2text-command "w3m -T text/html")

;; Time (seconds) between each mail retrieval
(setq mu4e-update-interval 300)

;; No need to type `g' to update
(setq mu4e-headers-auto-update t)

;; Show images in the view buffer
(setq mu4e-view-show-images t)

;; Verbose addresses
(setq mu4e-view-show-addresses t)
