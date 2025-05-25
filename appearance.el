;;; appearance.el -- Update appearance and theme -*- lexical-binding: t; -*-

;; Full-screen by default
(when (display-graphic-p)
  (toggle-frame-fullscreen))

;; Time format
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(setq display-time-string-forms
      '((propertize (format-time-string "%I:%M %p" now) 'face 'bold)))
(display-time)

;; Hide the tool bar
(tool-bar-mode 0)

;; Hide the menu bar
(menu-bar-mode 0)

;; Hide the scroll bar
(scroll-bar-mode 0)

;; Cursor type (thin)
(when (display-graphic-p)
  (setq-default cursor-type 'bar))

;; Do not display load average in mode line
(setq display-time-default-load-average nil)

;; Beaconize active position
(beacon-mode 1)
(setq beacon-size 12)

;; Practical frame-size
(setq frame-inhibit-implied-resize t)
(setq default-frame-alist '((width . 120) (height . 48)))

;; Add border inside frames
(add-to-list 'initial-frame-alist '(internal-border-width . 8))
(add-to-list 'default-frame-alist '(internal-border-width . 8))

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
(add-hook 'after-change-major-mode-hook
          (lambda ()
            (hl-line-mode
             (if (or (derived-mode-p 'shell-mode)
                     (equal major-mode 'term-mode)
                     (equal major-mode 'gud-mode)
                     (equal major-mode 'minibuffer-mode))
                 0 1))))

;;;; Prog-mode visuals

;; Extend margins in prog-mode
(defun my-set-margins ()
  (setq left-margin-width 3)
  (setq right-margin-width 3))

(add-hook 'prog-mode-hook 'my-set-margins)

;; Whitespaces
(defun my-whitespace-style ()
  (progn
    (setq show-trailing-whitespace t)
    ;;(setq whitespace-style '(face empty trailing tab-mark))
    (setq whitespace-display-mappings
          '(
            ;; (space-mark 32 [183] [46])
            (tab-mark 9 [187 9] [92 9])
            ))
    (set-face-attribute 'whitespace-tab nil
                        :background 'unspecified :foreground "gray19")
    (set-face-attribute 'whitespace-space nil
                        :background 'unspecified :foreground "gray19")
    (set-face-attribute 'whitespace-space-after-tab nil
                        :background 'unspecified :foreground "gray19")
    (whitespace-mode)))

(add-hook 'prog-mode-hook 'my-whitespace-style)

;;;; Theme
;; Start with nice base theme
(load-theme 'doom-sourcerer t)

;; Improve theme in graphic mode
(when (display-graphic-p)
  (set-background-color "#131517")
  (set-face-foreground 'line-number "gray13")
  (set-face-foreground 'line-number-current-line "honeydew4"))

;; Darker line between vertical splits
(when (display-graphic-p)
  (set-face-background 'vertical-border "#0a0e14")
  (set-face-foreground 'vertical-border (face-background 'vertical-border)))

;; Minimal window-divider
(when (display-graphic-p)
  (setq window-divider-default-right-width 4)
  (window-divider-mode))

;;;; Default font in gui mode
(when (display-graphic-p)
  ;; (add-to-list 'default-frame-alist '(font . "Monospace 12"))
  (add-to-list 'default-frame-alist '(font . "Source Code Pro 13")))
