;;; appearance.el -- Update emacs appearance and theme
(message "[ Update emacs appearance (user: %s) ]" (user-login-name))

;; Time format
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)

;; Hide the tool bar
(tool-bar-mode 0)

;; Hide the menu bar
(menu-bar-mode 0)

;; Hide the scroll bar
(scroll-bar-mode 0)

;; Practical frame-size
(setq frame-inhibit-implied-resize t)
(setq default-frame-alist '((width . 120) (height . 48)))

;; Add border inside frames
(add-to-list 'initial-frame-alist '(internal-border-width . 8))
(add-to-list 'default-frame-alist '(internal-border-width . 8))

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
          '((space-mark 32 [183] [46])
            (tab-mark 9 [187 9] [92 9])))
    (set-face-attribute 'whitespace-tab nil :background nil)
    (set-face-attribute 'whitespace-space-after-tab nil :foreground nil)
    (set-face-attribute 'whitespace-space-after-tab nil :background nil)
    (whitespace-mode)))

(add-hook 'prog-mode-hook 'my-whitespace-style)

;;;; Theme
;; Start with nice base theme
(load-theme 'doom-opera t)

;; Make it a bit darker
(set-background-color "#131517")

;; Dim line-number colors
(set-face-foreground 'line-number "gray13")
(set-face-foreground 'line-number-current-line "#4C566A")

;; Pretty mode-line (nord colors)
(set-face-attribute
 'mode-line nil
 :foreground "#ECEFF4"
 :background "#3B4252"
 :box '(:line-width 1 :color "#4C566A")
 :overline nil
 :underline nil)

(set-face-attribute
 'mode-line-inactive nil
 :foreground "#434C5E"
 :background "#1C2330"
 :box '(:line-width 1 :color "#2E3440")
 :overline nil
 :underline nil)

;; Darker line between vertical splits
(set-face-background 'vertical-border "gray7")
(set-face-foreground 'vertical-border (face-background 'vertical-border))

;; Use window-divider for some space in between
(setq window-divider-default-right-width 6)
(window-divider-mode)

;;;; Font
;; (add-to-list 'default-frame-alist '(font . "Monospace 12"))
(add-to-list 'default-frame-alist '(font . "Source Code Pro 13"))
