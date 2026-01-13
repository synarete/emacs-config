;;; config.el -- User specific configuration -*- lexical-binding: t; -*-

(my-user-config "config-common.el")
(my-user-config "config-ibuffer.el" '(ibuffer))
(my-user-config "config-text.el")
(my-user-config "config-prog.el")
(my-user-config "config-gdb.el")
(my-user-config "config-lsp.el" '(lsp-mode lsp-ui which-key))
(my-user-config "config-comint.el")
(my-user-config "config-misc.el")
