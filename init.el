;;; init.el --- Initialization file for Emacs -*- lexical-binding: t; -*-

(message "[ Start init (user: %s) ]"
         (user-login-name))

;; Packages
(message "[ Packages ]")

(my-load-user-init "packages.el")

;; Configurations
(message "[ Configure ]")

(my-load-user-init "config-common.el")

(my-load-user-init "config-comint.el")

(my-load-user-init "config-ibuffer.el"
                   :needs '(ibuffer))

(my-load-user-init "config-text.el"
                   :needs '(flyspell))

(my-load-user-init "config-prog.el"
                   :needs '(flymake))

(my-load-user-init "config-lsp.el"
                   :needs '(lsp-ui which-key))

(my-load-user-init "config-gdb.el"
                   :needs '(gud))

(my-load-user-init "config-treemacs.el"
                   :needs '(treemacs))

(my-load-user-init "config-misc.el"
                   :needs '(ido))

;; Key-bindings
(message "[ Key-bindings ]")

(my-load-user-init "keybind-common.el")

(my-load-user-init "keybind-cua.el")

(my-load-user-init "keybind-global.el")

(my-load-user-init "keybind-gud.el"
                   :needs '(gud))

;; Appearance
(message "[ Appearance ]")

(my-load-user-init "appearance-common.el")

(my-load-user-init "appearance-prog.el")

(my-load-user-init "appearance-doom.el"
                   :needs '(doom-themes doom-modeline))

(my-load-user-init "appearance-graphic.el"
                   :needs '(doom-themes doom-modeline)
                   :when 'display-graphic-p)

(my-load-user-init "appearance-magit.el"
                   :needs '(magit))

(my-load-user-init "appearance-theme-ext.el")

;; Finally
(message "[ After init ]")
(my-load-user-init "after-init.el"
                   :needs '(treemacs))

;; Ready!
(message "[ Done init in %s (user: %s) ]"
         (emacs-init-time) (user-login-name))
