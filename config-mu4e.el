;;; config-gmail.el -- mu4e settings (gmail) -*- lexical-binding: t; -*-

(require 'mu4e)

;; Resolve Mail dir relative to user home directory dynamically
(setq mu4e-maildir
      (expand-file-name "Mail" (getenv "HOME"))
      mu4e-get-mail-command "offlineimap"
      mu4e-update-interval 1200) ; Auto-sync every 20 minutes

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

;; Useful shortcut keys
(setq mu4e-maildir-shortcuts
      '(("/INBOX" . ?i)
        ("/[Gmail]/Sent Mail" . ?s)
        ("/[Gmail]/All Mail"  . ?a)))

;; Marked actions apply immediately without extra prompt when executing ('x')
(setq mu4e-headers-confirm-2-marks nil)

;; Prevent Gmail IMAP duplicate issues
(setq mu4e-trash-without-flag t)

;; Treat deleted/trashed mail properly for Gmail's archive model
(setq mu4e-sent-messages-behavior 'delete)

;; Show context header indicators cleanly
(setq mu4e-headers-leave-behavior 'apply)
(setq mu4e-headers-visible-lines 30)

;; Include related messages even if they aren't in the current folder/maildir
(setq mu4e-headers-include-related t)

;; Hide duplicate messages sharing the same Message-ID
(setq mu4e-headers-skip-duplicates t)

;; Clean thread visuals
(setq mu4e-headers-thread-root-prefix        '("* " . "* ")
      mu4e-headers-thread-first-child-prefix '("\\-> " . "\\-> ")
      mu4e-headers-thread-child-prefix       '("|-> " . "|-> ")
      mu4e-headers-thread-last-child-prefix  '("\\-> " . "\\-> ")
      mu4e-headers-thread-connection-prefix  '("|   " . "|   ")
      mu4e-headers-thread-blank-prefix       '("    " . "    ")
      mu4e-headers-thread-duplicate-prefix   '("=   " . "=   "))

;; Turn off fancy Unicodes
(setq mu4e-use-fancy-chars nil)

;; Enable threaded view by default in headers view
(setq mu4e-headers-show-threads t)

;; Split settings
(setq mu4e-split-view 'horizontal)

;; Use plain text format for sending
(setq mu4e-compose-format-flowed nil)

;; Set the line wrap width to 80 and enable automatic wrapping
(defun my-mu4e-compose-hook ()
  (setq-local fill-column 80)
  (auto-fill-mode 1))

(add-hook 'mu4e-compose-mode-hook #'my-mu4e-compose-hook)

;; Nicer text-wrapping and padding for article-mode
(defun my-mu4e-padding ()
  (my-setup-buffer-margins (current-buffer)))

(add-hook 'gnus-article-mode-hook #'my-mu4e-padding)
(add-hook 'mu4e-article-mode-hook #'visual-line-mode)

;; Force all mu4e header styles to use standard, non-italic text
(with-eval-after-load 'mu4e
  (set-face-attribute 'mu4e-related-face nil   :slant 'normal)
  (set-face-attribute 'mu4e-replied-face nil   :slant 'normal)
  (set-face-attribute 'mu4e-forwarded-face nil :slant 'normal)
  (set-face-attribute 'mu4e-unread-face nil    :slant 'normal)
  (set-face-attribute 'mu4e-header-face nil    :slant 'normal))

;; Strips background colors from thread-folding markers
(with-eval-after-load 'mu4e
  (set-face-attribute 'mu4e-thread-fold-face nil
                      :background 'unspecified :inherit 'default)
  (set-face-attribute 'mu4e-header-highlight-face nil
                      :underline nil))
