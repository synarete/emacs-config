;;; config-gdb.el -- Debug (GDB) configuration -*- lexical-binding: t; -*-

;;;; GUD configuration
(require 'gud)
(setq gdb-show-main t)
(setq gdb-display-io-nopopup t)
(setq gdb-non-stop-setting nil)
(setq gdb-restore-window-configuration-after-quit t)
(setq gdb-many-windows nil)

(defun my-gdb-mode ()
  "Add extra space before line-number for GDB pos indicator."
  (setq display-line-numbers-width 5))

(add-hook 'gdb-mode-hook #'my-gdb-mode)
