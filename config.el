;;; config.el -- User specific configuration -*- lexical-binding: t; -*-

(my-user-config "config-common.el")

(my-user-config "config-comint.el")

(my-user-config "config-ibuffer.el" :needs '(ibuffer))

(my-user-config "config-text.el" :needs '(flyspell))

(my-user-config "config-prog.el" :needs '(flymake))

(my-user-config "config-lsp.el" :needs '(lsp-ui which-key))

(my-user-config "config-gdb.el" :needs '(gud))

(my-user-config "config-treemacs.el" :needs '(treemacs))

(my-user-config "config-misc.el" :needs '(ido))
