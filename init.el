;;; init.el --- Initialization file for Emacs -*- lexical-binding: t; -*-


;; Start
(message "[ Start init (user: %s) ]" (user-login-name))

;; Packages
(message "[ Packages ]")
(my-load-user-init "packages.el")

;; Config
(message "[ Configure ]")
(my-load-user-init "config-common.el")
(my-load-user-init "config-packages.el")
(my-load-user-init "config-lsp.el")
(my-load-user-init "config-mu4e.el")

;; Key-bind
(message "[ Key-bindings ]")
(my-load-user-init "keybind.el")

;; Appearance
(message "[ Appearance ]")
(my-load-user-init "appearance-common.el")
(my-load-user-init "appearance-packages.el")
(my-load-user-init "appearance-theme-ext.el")

;; Finally
(message "[ After init ]")
(my-load-user-init "after-init.el")

;; Ready!
(message "[ Done init in %s ]" (emacs-init-time))
