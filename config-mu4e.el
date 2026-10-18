;;; config-mu4e.el -- mu4e settings (gmail) -*- lexical-binding: t; -*-

(defun my-mu4e-compose-hook ()
  "Set fill column to 80 and enable auto-fill mode for email composition."
  (setq-local fill-column 80)
  (auto-fill-mode 1))

(defun my-mu4e-padding ()
  "Apply custom margins to gnus article buffer."
  (my-setup-buffer-margins (current-buffer)))

(use-package mu4e
  :ensure nil
  :defer t
  :commands (mu4e)

  :init
  (setq user-full-name "Shachar Sharon"
        user-mail-address "synarete@gmail.com")

  :config
  ;; Mail directory & sync execution
  (setq mu4e-maildir (expand-file-name "Mail" (getenv "HOME"))
        mu4e-get-mail-command "offlineimap"
        mu4e-update-interval nil)

  ;; Sending mail via msmtp
  (setq send-mail-function 'sendmail-send-it
        sendmail-program (executable-find "msmtp")
        mail-specify-envelope-from t
        mail-envelope-from 'header)

  ;; Gmail folder mappings
  (setq mu4e-drafts-folder "/[Gmail]/Drafts"
        mu4e-sent-folder   "/[Gmail]/Sent Mail"
        mu4e-trash-folder  "/[Gmail]/Trash"
        mu4e-refile-folder "/[Gmail]/All Mail")

  ;; Maildir shortcuts
  (setq mu4e-maildir-shortcuts
        '(("/INBOX"             . ?i)
          ("/[Gmail]/Sent Mail" . ?s)
          ("/[Gmail]/All Mail"  . ?a)))

  ;; Gmail workflow & marking behavior
  (setq mu4e-headers-confirm-2-marks nil
        mu4e-trash-without-flag t
        mu4e-sent-messages-behavior 'delete
        mu4e-headers-leave-behavior 'apply)

  ;; Header display & thread configurations
  (setq mu4e-headers-visible-lines 30
        mu4e-headers-include-related t
        mu4e-headers-skip-duplicates t
        mu4e-use-fancy-chars nil
        mu4e-headers-show-threads t
        mu4e-split-view 'horizontal)

  ;; Thread visual prefixing
  (setq mu4e-headers-thread-root-prefix        '("* " . "* ")
        mu4e-headers-thread-first-child-prefix '("\\-> " . "\\-> ")
        mu4e-headers-thread-child-prefix       '("|-> " . "|-> ")
        mu4e-headers-thread-last-child-prefix  '("\\-> " . "\\-> ")
        mu4e-headers-thread-connection-prefix  '("|   " . "|   ")
        mu4e-headers-thread-blank-prefix       '("    " . "    ")
        mu4e-headers-thread-duplicate-prefix   '("=   " . "=   "))

  ;; Composition behavior
  (setq mu4e-compose-format-flowed nil)

  ;; Face overrides
  (dolist (face '(mu4e-related-face
                  mu4e-replied-face
                  mu4e-forwarded-face
                  mu4e-unread-face
                  mu4e-header-face))
    (set-face-attribute face nil :slant 'normal))

  (set-face-attribute 'mu4e-thread-fold-face nil
                      :background 'unspecified :inherit 'default)
  (set-face-attribute 'mu4e-header-highlight-face nil
                      :underline nil)

  :hook
  ((mu4e-compose-mode . my-mu4e-compose-hook)
   (gnus-article-mode . my-mu4e-padding)
   (mu4e-article-mode . visual-line-mode)))
