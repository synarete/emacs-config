;;; appearance-theme-ext.el  -*- lexical-binding: t; -*-

;; Improve theme's background
(set-face-attribute 'default nil :background "#131517")

;; Trailing white-space color
(set-face-attribute 'trailing-whitespace nil :background "#212123")

;; Line highlight
(set-face-attribute 'hl-line nil :background "#2d3335")

;; Line numbers colors
(set-face-attribute 'line-number nil :foreground "gray29")
(set-face-attribute 'line-number-current-line nil :foreground "honeydew4")

;; Dark line between vertical splits
(set-face-background 'vertical-border "#0a0e14")
(set-face-foreground 'vertical-border (face-background 'vertical-border))

;; Mode-line box
(set-face-attribute 'mode-line nil
                    :box '(:line-width 2 :color "#2e3440")
                    :background "#2e3440")
(set-face-attribute 'mode-line-inactive nil
                    :box '(:line-width 2 :color "#222224"))

;; Cursor
(defun my-cursor-style-hook ()
  (if overwrite-mode
      (set-face-attribute 'cursor nil :background "red")
    (set-face-attribute 'cursor nil :background "gray")))

(add-hook 'overwrite-mode-hook #'my-cursor-style-hook)
(set-face-attribute 'cursor nil :background "gray")

;; Parentheses
(set-face-attribute 'show-paren-match nil
                    :background "gray29" :foreground "ivory" :weight 'bold)

;; Make other buffer dimmer
(require 'auto-dim-other-buffers)

(defun my-setup-auto-dim ()
  "Darker background color for non-active buffers."
  (auto-dim-other-buffers-mode 1)
  (setq auto-dim-other-buffers-dim-selected t)
  (let ((bg (face-background 'default nil t)))
    (face-spec-set 'auto-dim-other-buffers-face
                   `((t :background ,(color-darken-name bg 10))))))

(add-hook 'after-init-hook #'my-setup-auto-dim)
