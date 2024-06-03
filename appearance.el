;;; config.el -- Update emacs appearance and theme
(message "[ Update emacs appearance for %s ]" (user-login-name))

;; hide the tool bar
(tool-bar-mode 0)

;; hide the menu bar
(menu-bar-mode 0)

;; hide the scroll bar
(scroll-bar-mode 0)

;; Show time
(display-time)

;; Practical frame-size
(setq frame-inhibit-implied-resize t)
(setq default-frame-alist '((width . 120) (height . 42)))

;; Add padding inside buffer windows
(setq-default left-margin-width 2)
(setq-default right-margin-width 2)

;; Add padding inside frames (windows)
(add-to-list 'default-frame-alist '(internal-border-width . 8))

;; Default font
(add-to-list 'default-frame-alist '(font . "Source Code Pro 14"))

;; Theme
(load-theme 'doom-nord t)
