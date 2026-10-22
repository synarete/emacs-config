;;; appearance-common.el  -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Common appearance settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Display buffer-size
(size-indication-mode)

;; Hide the tool bar
(tool-bar-mode 0)

;; Hide the menu bar
(menu-bar-mode 0)

;; Do not display load average in mode line
(setopt display-time-default-load-average nil)

;; Split window proportionally
(setopt window-combination-resize t)

;; Cursor
(setq-default cursor-type 'box)
(blink-cursor-mode 1)

;; Highlight matching parantheses when the point is on them
(show-paren-mode 1)
(setopt show-paren-delay 0)
(setopt show-paren-context-when-visible t)

;; Highlight text selection
(transient-mark-mode 1)

;; Keep syntax highlighting in the current line
(set-face-foreground 'highlight nil)

;; Hide the scroll bar
(scroll-bar-mode 0)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Frame and font configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'seq)

;; Private font settings
(defconst my-font-list
  '("IBM Plex Mono-14" "Source Code Pro-13" "Monospace-12"))

(defun my-select-font ()
  (seq-find
   (lambda (name)
     (ignore-errors (find-font (font-spec :name name))))
   my-font-list))

;; Frame configuration
(use-package frame
  :ensure nil
  :custom
  ;; Prevent automatic frame resizing when graphic elements change
  (frame-inhibit-implied-resize t)

  :config
  ;; Add internal border padding inside frames
  (add-to-list 'default-frame-alist '(internal-border-width . 4))

  ;; Apply first available font dynamically
  (when-let ((font-name (my-select-font)))
    (add-to-list 'default-frame-alist `(font . ,font-name)))

  ;; Avoid italic fonts across all faces
  (set-face-attribute 'italic nil :slant 'normal))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Time-display setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package time
  :ensure nil
  :custom
  (display-time-day-and-date t)
  (display-time-24hr-format t)
  :config
  (display-time-mode 1))
