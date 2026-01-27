;;; appearance-graphic.el   -*- lexical-binding: t; -*-

;;;; Frame
;; Prevent automatic frame resizing when graphic elements change
(setq frame-inhibit-implied-resize t)

;; Add border inside frames
(add-to-list 'default-frame-alist '(internal-border-width . 4))

;; Minimal window-divider
(customize-set-variable 'window-divider-default-right-width 4)
(window-divider-mode)

;;;; Font setup
(defconst my-font-list
  '("IBM Plex Mono-14" "Source Code Pro-13" "Monospace-12"))

(defun my-find-font (my-font-name)
  (find-font (font-spec :name my-font-name)))

(defun my-select-font ()
  (seq-find #'my-find-font my-font-list))

(add-to-list 'default-frame-alist (cons 'font (my-select-font)))

;;;; Mode-line
;; Display time in mode-line
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)

;;;; Shell
(defun my-shell-mode ()
  (set (make-local-variable 'face-remapping-alist)
       '((default :background "gray4"))))

(add-hook 'shell-mode-hook #'my-shell-mode)
