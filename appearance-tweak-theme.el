;;; appearance-tweak-theme.el  -*- lexical-binding: t; -*-

;; Improve theme's background
(set-background-color "#131517")

;; Trailing white-space color
(set-face-background 'trailing-whitespace "#212123")

;; Line highlight
(set-face-background 'hl-line "#2d3335")

;; Line numbers colors
(set-face-attribute 'line-number nil :foreground "gray29")
(set-face-attribute 'line-number-current-line nil :foreground "honeydew4")

;; Darker line between vertical splits
(set-face-background 'vertical-border "#0a0e14")
(set-face-foreground 'vertical-border (face-background 'vertical-border))

;;;; Mode-line box
(set-face-attribute 'mode-line nil
                    :box '(:line-width 2 :color "#2e3440")
                    :background "#2e3440")
(set-face-attribute 'mode-line-inactive nil
                    :box '(:line-width 2 :color "#222224"))
