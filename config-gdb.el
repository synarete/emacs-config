;;; config-gdb.el -- Debug (GDB) configuration -*- lexical-binding: t; -*-

(require 'gud)
(setq gdb-show-main t)
(setq gdb-restore-window-configuration-after-quit t)
(setq gdb-display-io-nopopup t)
(setq gdb-many-windows nil)
(setq gdb-non-stop-setting nil)
