;;;; IBuffer settings & layout
(require 'ibuffer)
(setq ibuffer-saved-filter-groups
      (quote
       (("default"
         ("Debug"
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
           (mode . term-mode)
           (mode . shell-mode)
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
         ("Shell"
          (or
           (mode . sh-mode)
           (mode . shell-script-mode)))
         ("Text"
          (or
           (mode . text-mode)
           (mode . markdown-mode)
           (mode . rst-mode)))
         ))))

(defun my-ibuffer-mode ()
  (ibuffer-switch-to-saved-filter-groups "default")
  (setq ibuffer-show-empty-filter-groups nil)
  (setq ibuffer-default-shrink-to-minimum-size nil)
  (setq ibuffer-use-other-window nil)
  (setq ibuffer-display-summary nil)
  (ibuffer-auto-mode 1))

(add-hook 'ibuffer-mode-hook #'my-ibuffer-mode)
