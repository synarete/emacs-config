;;; email.el -- Use emacs as E-mail client
(message "[ Setup mail (user: %s) ]" (user-login-name))

(require 'gnus)
(require 'gnus-sum)
(require 'nnimap)

;; Who am I
(setq user-mail-address "synarete@gmail.com")
(setq user-full-name "Shachar Sharon")

;;;; Where to put mail and news
(setq my-homedir (expand-file-name (concat "~" (user-login-name))))
(setq message-directory (concat user-emacs-directory "mail"))
(setq gnus-directory (concat user-emacs-directory "news"))
(setq nnfolder-directory (concat user-emacs-directory "mail" "archive"))


;;;; General mail settings

;; Spell checker for out-going messages
(add-hook 'message-send-hook 'ispell-message)

;; Send mail through an external mail host
(setq message-send-mail-function 'smtpmail-send-it)

;; Ask encryption password once
(setq epa-file-cache-passphrase-for-symmetric-encryption t)

;;;; SMTP (for Gmail)
(defvar my-smtp-server "smtp.gmail.com")

(setq smtpmail-default-smtp-server my-smtp-server)
(setq smtpmail-smtp-server my-smtp-server)
(setq smtpmail-smtp-service 587)
(setq smtpmail-starttls-credentials
      '((my-smtp-server 587 nil nil)))
(setq smtpmail-auth-credentials
      '((my-smtp-server 587 user-mail-address nil)))
(setq smtpmail-stream-type 'starttls)


;;;; Gnus
;; Gmail by default
(setq gnus-select-method '(nnimap "imap.gmail.com"))

;; Sort method
(setq gnus-thread-sort-functions
      '(gnus-thread-sort-by-most-recent-date
        (not gnus-thread-sort-by-number)))

;; Increase score of group after reading it
(add-hook 'gnus-summary-exit-hook 'gnus-summary-bubble-group)

;; Select method fro gmail
(add-to-list
 'gnus-secondary-select-methods
 '(nnimap "gmail"
          (nnimap-address "imap.gmail.com")
          (nnimap-server-port 993)
          (nnimap-stream ssl)
          (nnir-search-engine imap)
          (nnimap-inbox "INBOX")
          (nnmail-expiry-target "nnimap+gmail:[Gmail]/Trash")
          (nnmail-expiry-wait immediate)))

;; Mark group-cc messages as read
(setq gnus-gcc-mark-as-read t)

;; No auto-save
(setq gnus-use-dribble-file nil)

;; No smileys
(setq gnus-treat-display-smileys nil)

;; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups
      "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")


;; Make summary forwarding behave a little better. This also makes
;; message forwarding and summary forwarding consistent. But note that
;; if you wish to forward an attachment you must use M-2\C-c\C-f.
;; see: https://www.bobnewell.net/publish/35years/gnuhacks.html
(setq message-forward-as-mime nil)
(setq message-forward-show-mml nil)
(setq message-forward-included-headers "^Date\\|^From\\|^To\\|^Subject:")

;;;; Gnus appearance
(setq gnus-group-line-format "%M%S%5y:%B%(%g%)\n")
(setq gnus-user-date-format-alist '((t . "%Y-%m-%d %H:%M")))
(setq gnus-summary-line-format "%U%R %-18,18&user-date; %4L:%-25,25f %B%s\n")
(setq gnus-summary-to-prefix "To: ")
(setq gnus-summary-mode-line-format "[%U] %p")
(setq gnus-sum-thread-tree-false-root "")
(setq gnus-sum-thread-tree-indent " ")
(setq gnus-sum-thread-tree-single-indent "")
(setq gnus-sum-thread-tree-leaf-with-other "+-> ")
(setq gnus-sum-thread-tree-root "")
(setq gnus-sum-thread-tree-single-leaf "\\-> ")
(setq gnus-sum-thread-tree-vertical "|")
(setq gnus-thread-sort-functions '(gnus-thread-sort-by-most-recent-date))
(setq gnus-subthread-sort-functions '(gnus-thread-sort-by-date))

;;;; Gnus key-bindings
;; Move to Trash
(define-key
 gnus-summary-mode-map "vt"
 (lambda ()
   (interactive)
   (gnus-summary-move-article nil "nnimap+gmail:[Gmail]/Trash" nil)))

;; Move to INBOX
(define-key
 gnus-summary-mode-map "vi"
 (lambda () (interactive)
   (gnus-summary-move-article nil "nnimap+gmail:INBOX" nil)))
