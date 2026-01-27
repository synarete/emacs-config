;;; appearance-common.el  -*- lexical-binding: t; -*-

;; Display buffer-size
(size-indication-mode)

;; Hide the tool bar
(tool-bar-mode 0)

;; Hide the menu bar
(menu-bar-mode 0)

;; Hide the scroll bar
(scroll-bar-mode 0)

;; Do not display load average in mode line
(setq display-time-default-load-average nil)

;; Split window proportionally
(setq window-combination-resize t)

;;;; Cursor
(setq-default cursor-type 'box)
(set-cursor-color "gray")
(blink-cursor-mode 1)

;;;; Hightlights
;; Highlight matching parantheses when the point is on them
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Highlight the marked region.
(setq-default transient-mark-mode t)

;; Highlight text selection
(transient-mark-mode 1)

;; Keep syntax highlighting in the current line
(set-face-foreground 'highlight nil)

;; Highligh current line unless in special-mode
(defun my-hl-line ()
  (hl-line-mode
   (if (or
        (derived-mode-p 'shell-mode)
        (equal major-mode 'term-mode)
        (equal major-mode 'gud-mode)
        (equal major-mode 'minibuffer-mode))
       0 1)))

;;(add-hook 'after-change-major-mode-hook #'my-hl-line)
