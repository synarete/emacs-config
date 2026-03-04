;;; keybind-common.el  -*- lexical-binding: t; -*-

;; Delete TABs the normal way
(setq backward-delete-char-untabify-method nil)

;; Window switching with ALT (or CTRL in terminal mode)
(if (display-graphic-p)
    (windmove-default-keybindings 'meta)
  (windmove-default-keybindings 'ctrl))
