;;; appearance-common.el  -*- lexical-binding: t; -*-

;; Display buffer-size
(size-indication-mode)

;; Hide the tool bar
(tool-bar-mode 0)

;; Hide the menu bar
(menu-bar-mode 0)

;; Highligh current line
(global-hi-lock-mode 1)

;; Do not display load average in mode line
(setq display-time-default-load-average nil)

;; Split window proportionally
(setq window-combination-resize t)

;; Cursor
(setq-default cursor-type 'box)
(blink-cursor-mode 1)

;; Highlight matching parantheses when the point is on them
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Highlight the marked region.
(setq-default transient-mark-mode t)

;; Highlight text selection
(transient-mark-mode 1)

;; Keep syntax highlighting in the current line
(set-face-foreground 'highlight nil)
