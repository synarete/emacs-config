;;; init.el --- Initialization file for Emacs -*- lexical-binding: t; -*-

(message "[ Start init (user: %s) ]" (user-login-name))

;; Packages
(message "[ Packages ]")

(my-load-user-init "packages.el")

;; Configurations
(message "[ Configure ]")

(my-load-user-init "config-common.el")

(my-load-user-init "config-packages.el")

(my-load-user-init "config-prog.el" :needs '(flymake))

(my-load-user-init "config-lsp.el" :needs '(lsp-ui which-key))

(my-load-user-init "config-gdb.el" :needs '(gud))

(my-load-user-init "config-treemacs.el" :needs '(treemacs))

(my-load-user-init "config-mu4e.el")

(my-load-user-init "config-gptel.el" :needs '(gptel))

(my-load-user-init "config-nw.el" :term t)

(my-load-user-init "config-mouse.el" :graphic t)

;; Key-bindings
(message "[ Key-bindings ]")

(my-load-user-init "keybind-global.el")

;; Appearance
(message "[ Appearance ]")

(my-load-user-init "appearance-common.el")

(my-load-user-init "appearance-packages.el")

(my-load-user-init "appearance-prog.el")

(my-load-user-init "appearance-doom.el"
                   :needs '(doom-themes doom-modeline))

(my-load-user-init "appearance-graphic.el"
                   :graphic t :needs '(doom-themes doom-modeline))

(my-load-user-init "appearance-theme-ext.el"
                   :needs '(doom-themes doom-modeline))

;; Finally
(message "[ After init ]")
(my-load-user-init "after-init.el" :needs '(treemacs))

;; Ready!
(message "[ Done init in %s (user: %s) ]" (emacs-init-time) (user-login-name))
