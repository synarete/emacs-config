;;; init.el --- My emacs initialization file -*- lexical-binding: t; -*-

(message "[ Start init (user: %s) ]" (user-login-name))

(my-load-user-init "config-common.el")
(my-load-user-init "config-packages.el")
(my-load-user-init "config-lsp.el")
(my-load-user-init "config-mu4e.el")
(my-load-user-init "keybind.el")
(my-load-user-init "appearance-common.el")
(my-load-user-init "appearance-packages.el")
(my-load-user-init "after-init.el")

(message "[ Done init in %s ]" (emacs-init-time))
