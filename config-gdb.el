;;; config-gdb.el -- Debug (GDB) configuration -*- lexical-binding: t; -*-

;;;; GUD configuration
(require 'gud)
(setq gdb-show-main t)
(setq gdb-display-io-nopopup t)
(setq gdb-non-stop-setting nil)
(setq gdb-restore-window-configuration-after-quit t)
(setq gdb-many-windows t)
