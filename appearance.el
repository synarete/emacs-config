;;; config.el -- Update emacs appearance and theme
(message "[ Update emacs appearance for %s ]" (user-login-name))

;; Show time
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

;;;; Font
;; (add-to-list 'default-frame-alist '(font . "Monospace 12"))
(add-to-list 'default-frame-alist '(font . "Source Code Pro 12"))

;;;; Theme
;; Start with nice base theme
(load-theme 'doom-opera t)

;; Make it a bit darker
(set-background-color "gray8")

;; Make active buffer a bit darker
(defun my-not-a-special-window (w)
  (not (string-prefix-p "*" (buffer-name (window-buffer w)))))

(defun my-highlight-active-buffer ()
  (walk-windows
   (lambda (w)
     (when (my-not-a-special-window w)
       (if (eq w (selected-window))
           (with-current-buffer (window-buffer w)
             (buffer-face-set '(:background "gray9")))
         (with-current-buffer (window-buffer w)
           (buffer-face-set '(:background "gray7")))))
     )))

(add-hook 'buffer-list-update-hook 'my-highlight-active-buffer)

;; Pretty mode-line
(set-face-attribute
 'mode-line nil
 :foreground "seashell"
 :background "#636082"
 :box '(:line-width 2 :color "#626180")
 :overline nil
 :underline nil)

(set-face-attribute
 'mode-line-inactive nil
 :foreground "gray"
 :background "#353644"
 :box '(:line-width 2 :color "gray7")
 :overline nil
 :underline nil)
