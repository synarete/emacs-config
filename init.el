;;; init.el --- Initialization file for Emacs -*- lexical-binding: t; -*-

(message "[ Start init (user: %s) ]" (user-login-name))

(message "[ Setup packages ]")
(my-user-config "packages.el")

(message "[ Configure ]")
(my-user-config "config.el")

(message "[ Setup key-bindings ]")
(my-user-config "keybind.el")

(message "[ Update appearance ]")
(my-user-config "appearance.el")
(my-user-config-if (display-graphic-p) "appearance-graphic.el")

(message "[ Done init in %s (user: %s) ]" (emacs-init-time) (user-login-name))
