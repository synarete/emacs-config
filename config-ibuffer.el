;;; config-ibuffer.el -- Ibuffer configuration -*- lexical-binding: t; -*-

(require 'ibuffer)

;;;; IBuffer settings & layout
(setq ibuffer-saved-filter-groups
      (quote
       (("default"
         ("GDB"
          (or
           (mode . gud-mode)
           (mode . gud-tooltip-mode)
           (mode . gdb-breakpoints-mode)
           (mode . gdb-disassembly-mode)
           (mode . gdb-frames-mode)
           (mode . gdb-inferior-io-mode)
           (mode . gdb-locals-mode)
           (mode . gdb-memory-mode)
           (mode . gdb-registers-mode)
           (mode . gdb-script-mode)
           (mode . gdb-threads-mode)
           ))
         ("Shell"
          (or
           (mode . shell-mode)
           (mode . term-mode)
           (mode . eshell-mode)))
         ("C/C++"
          (or
           (mode . c-mode)
           (mode . c++-mode)))
         ("Python"
          (mode . python-mode))
         ("Lisp/Scheme"
          (or
           (mode . scheme-mode)
           (mode . lisp-mode)
           (mode . emacs-lisp-mode)))
         ("Script"
          (or
           (mode . sh-mode)
           (mode . shell-script-mode)))
         ("Text"
          (or
           (mode . text-mode)
           (mode . markdown-mode)
           (mode . rst-mode)))
         ("Magit"
          (derived-mode . magit-mode))
         ))))

(defun my-ibuffer-mode ()
  (setq ibuffer-expert t)
  (setq ibuffer-show-empty-filter-groups nil)
  (setq ibuffer-default-shrink-to-minimum-size nil)
  (setq ibuffer-use-other-window nil)
  (setq ibuffer-display-summary nil)
  (setq ibuffer-default-sorting-mode 'filename/process)
  (setq ibuffer-title-face 'font-lock-doc-face)
  (setq ibuffer-use-header-line t)
  (ibuffer-switch-to-saved-filter-groups "default")
  (ibuffer-auto-mode 1))

(add-hook 'ibuffer-mode-hook #'my-ibuffer-mode)
