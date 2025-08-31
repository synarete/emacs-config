;;; appearance-graphic.el   -*- lexical-binding: t; -*-

;; Practical frame-size
(setq frame-inhibit-implied-resize t)
(setq default-frame-alist
      '((width . 120)
        (height . 40)))

;; Full-screen by default
;; (toggle-frame-fullscreen)

;;;; Theme
;; Start with nice base theme
(load-theme 'doom-opera t)

;; Improve theme in graphic mode
(set-background-color "#131517")
(set-face-foreground 'line-number "gray13")
(set-face-foreground 'line-number-current-line "honeydew4")

;; Darker line between vertical splits
(set-face-background 'vertical-border "#0a0e14")
(set-face-foreground 'vertical-border (face-background 'vertical-border))

;; Minimal window-divider
(setq window-divider-default-right-width 4)
(window-divider-mode)

;;;; Default font in gui mode
;; (add-to-list 'default-frame-alist '(font . "Monospace 12"))
(add-to-list 'default-frame-alist '(font . "Source Code Pro 13"))

;;;; Mode-line
;; Box mode-line + nord0 color for active
(set-face-attribute 'mode-line nil
                    :box '(:line-width 2 :color "#2e3440")
                    :background "#2e3440")

(set-face-attribute 'mode-line-inactive nil
                    :box '(:line-width 2 :color "#222224"))

;;;; Cursor
(setq-default cursor-type 'box)
(set-cursor-color "gray")
(blink-cursor-mode 1)
(setq blink-cursor-interval .7)
(setq blink-cursor-blinks 7)

;;;; Terminal
;; Extend margins in term-mode
(defun my-term-mode-margins ()
  (setq left-margin-width 2)
  (setq right-margin-width 2))

;; Make terminal background a bit darker
(defun my-term-mode-face-remap ()
  (face-remap-add-relative 'default '(:background "#121212")))

(defun my-term-mode ()
  (interactive)
  (my-term-mode-margins)
  (my-term-mode-face-remap))

(add-hook 'term-mode-hook #'my-term-mode)
