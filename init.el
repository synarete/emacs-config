;;; init.el --- My emacs initialization file -*- lexical-binding: t; -*-

(defun my-load-user-init (file-name)
  "Load FILE-NAME from `user-emacs-directory'; signal an error on failure."
  (load (expand-file-name file-name user-emacs-directory) nil nil t))

;; Load my settings
(message "[ Start init (user: %s) ]" (user-login-name))
(my-load-user-init "config-common.el")
(my-load-user-init "config-packages.el")
(my-load-user-init "config-lsp.el")
(my-load-user-init "config-mu4e.el")
(my-load-user-init "config-magit.el")
(my-load-user-init "keybind.el")
(my-load-user-init "appearance-common.el")
(my-load-user-init "appearance-packages.el")
(my-load-user-init "after-init.el")
(message "[ Done init in %s ]" (emacs-init-time))
