;;; appearance.el -- Update appearance and theme -*- lexical-binding: t; -*-

;; Time format
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(setq display-time-string-forms
      '((propertize (format-time-string "%I:%M %p " now) 'face 'bold)))
(display-time)

;; Hide the tool bar
(tool-bar-mode 0)

;; Hide the menu bar
(menu-bar-mode 0)

;; Hide the scroll bar
(scroll-bar-mode 0)

;; Do not display load average in mode line
(setq display-time-default-load-average nil)

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
(defun my-hl-line ()
  (hl-line-mode
   (if (or
        (derived-mode-p 'shell-mode)
        (equal major-mode 'term-mode)
        (equal major-mode 'gud-mode)
        (equal major-mode 'minibuffer-mode))
       0 1)))

(add-hook 'after-change-major-mode-hook #'my-hl-line)

;;;; Prog-mode visuals

;; Extend margins in prog-mode
(defun my-prog-mode-margins ()
  (interactive)
  (setq left-margin-width 1)
  (setq right-margin-width 1))

(add-hook 'prog-mode-hook 'my-prog-mode-margins)

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

(add-hook 'prog-mode-hook #'my-whitespace-style)

;;;; Window
;; Split window proportionally
(setq window-combination-resize t)

;;;; Theme
;; Start with nice base theme
(load-theme 'doom-sourcerer t)

;;;; Mode-line
;; https://github.com/seagle0128/doom-modeline?tab=readme-ov-file#customize
(doom-modeline-mode 1)
(setq doom-modeline-bar-width 0)
(setq doom-modeline-buffer-file-name-style 'relative-to-project)
(setq doom-modeline-icon nil)
(setq doom-modeline-major-mode-icon nil)
(setq doom-modeline-time-icon nil)
(setq doom-modeline-time-live-icon nil)
(setq doom-modeline-battery nil)
(setq doom-modeline-env-version nil)
(setq doom-modeline-column-zero-based nil)
