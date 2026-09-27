;;; appearance-graphic.el   -*- lexical-binding: t; -*-

;; Hide the scroll bar
(scroll-bar-mode 0)

;;;; Frame
;; Prevent automatic frame resizing when graphic elements change
(setq frame-inhibit-implied-resize t)

;; Add border inside frames
(add-to-list 'default-frame-alist '(internal-border-width . 4))

;; Window divider
;; (window-divider-mode)

;;;; Font setup
(require 'seq)

(defconst my-font-list
  '("IBM Plex Mono-14" "Source Code Pro-13" "Monospace-12"))

(defun my-select-font ()
  (seq-find
   (lambda (name)
     (ignore-errors (find-font (font-spec :name name))))
   my-font-list))

(when-let ((font-name (my-select-font)))
  (add-to-list 'default-frame-alist `(font . ,font-name)))

;; Avoid italic fonts
(set-face-attribute 'italic nil :slant 'normal)

;;;; Mode-line
;; Display time in mode-line
(setopt display-time-day-and-date t)
(setopt display-time-24hr-format t)
(display-time-mode 1)

;;;; Eat background
(defun my-eat-face-remap ()
  (face-remap-add-relative 'default :background "gray2"))

(add-hook 'eat-mode-hook #'my-eat-face-remap)
