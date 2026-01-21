;;; appearance-graphic.el   -*- lexical-binding: t; -*-

;;;; Frame
;; Prevent automatic frame resizing when graphic elements change
(setq frame-inhibit-implied-resize t)

;; Add border inside frames
(add-to-list 'default-frame-alist '(internal-border-width . 4))

;;;; Theme
;; Start with nice base theme
(load-theme 'doom-opera t)

;; Improve theme's background in graphic mode
(set-background-color "#131517")

;; Line numbers colors
(set-face-attribute 'line-number nil :foreground "gray13")
(set-face-attribute 'line-number-current-line nil :foreground "honeydew4")

;; Darker line between vertical splits
(set-face-background 'vertical-border "#0a0e14")
(set-face-foreground 'vertical-border (face-background 'vertical-border))

;; Minimal window-divider
(customize-set-variable 'window-divider-default-right-width 4)
(window-divider-mode)

;; Trailing white-space color
(set-face-background 'trailing-whitespace "#212123")

;;;; Font setup
(defconst my-font-list
  '("IBM Plex Mono-14" "Source Code Pro-13" "Monospace-12"))

(defun my-find-font (my-font-name)
  (find-font (font-spec :name my-font-name)))

(defun my-select-font ()
  (seq-find #'my-find-font my-font-list))

(add-to-list 'default-frame-alist (cons 'font (my-select-font)))

;;;; Mode-line
;; Box mode-line + nord0 color for active
(set-face-attribute 'mode-line nil
                    :box '(:line-width 2 :color "#2e3440")
                    :background "#2e3440")
(set-face-attribute 'mode-line-inactive nil
                    :box '(:line-width 2 :color "#222224"))

;;;; Shell
(defun my-shell-mode ()
  (set (make-local-variable 'face-remapping-alist)
       '((default :background "gray4"))))

(add-hook 'shell-mode-hook #'my-shell-mode)

;;;; Cursor
(setq-default cursor-type 'box)
(set-cursor-color "gray")
(blink-cursor-mode 1)

;; Change cursor color in overwrite mode
(defun my-cursor-mode ()
  (interactive)
  (if overwrite-mode
      (set-face-attribute 'cursor nil :background "brown")
    (set-face-attribute 'cursor nil :background "gray")))

(when (boundp 'overwrite-mode-hook)
  (add-hook 'overwrite-mode-hook #'my-cursor-mode))
