;;; appearance-graphic.el   -*- lexical-binding: t; -*-

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
(setq blink-cursor-interval .5)
(setq blink-cursor-blinks 5)
(set-cursor-color "gray")

;; Beaconize active position
(beacon-mode 1)
(setq beacon-size 16)
