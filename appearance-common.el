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

;; Split window proportionally
(setopt window-combination-resize t)

;; Highlight matching parentheses immediately, and show the opening line
;; in the echo area when it is off-screen
(setopt show-paren-delay 0)
(setopt show-paren-context-when-visible t)

;; Faces set via the `user' theme survive any later `load-theme'
(custom-set-faces
 ;; Keep syntax highlighting in highlighted text (e.g. current line)
 '(highlight ((t (:foreground unspecified))))
 ;; Avoid italic fonts across all faces which inherit `italic'
 '(italic ((t (:slant normal)))))

;; Hide the scroll bar
(scroll-bar-mode 0)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Frame and font configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Private font settings
(defconst my-font-list
  '("IBM Plex Mono-14" "Source Code Pro-13" "Monospace-12"))

(defun my-select-font ()
  "Return the first font in `my-font-list' available on this system."
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
  (when-let* ((font-name (my-select-font)))
    (add-to-list 'default-frame-alist `(font . ,font-name))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Time-display setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package time
  :ensure nil
  :custom
  (display-time-day-and-date t)
  (display-time-24hr-format t)
  ;; Do not display load average in mode line
  (display-time-default-load-average nil)
  :config
  (display-time-mode 1))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cursor settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-update-cursor-style (&rest _)
  "Update cursor background color based on `overwrite-mode'.
The `cursor' face is global while `overwrite-mode' is buffer-local, so
this also runs whenever the selected window or its buffer changes."
  (let ((color (if overwrite-mode "red" "gray")))
    ;; Avoid needless face changes, which force a full redisplay
    (unless (equal (face-background 'cursor) color)
      (set-face-attribute 'cursor nil :background color))))

;; Update cursor color when toggling overwrite-mode on or off
(add-hook 'overwrite-mode-hook #'my-update-cursor-style)

;; Update cursor color when switching to a buffer with a different state
(add-hook 'window-selection-change-functions #'my-update-cursor-style)
(add-hook 'window-buffer-change-functions #'my-update-cursor-style)

;; Re-apply cursor color whenever a theme is enabled
(add-hook 'enable-theme-functions #'my-update-cursor-style)

;; Initial state setup
(my-update-cursor-style)
