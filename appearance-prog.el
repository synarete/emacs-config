;;; appearance-prog.el  -*- lexical-binding: t; -*-

;;;; Prog-mode visuals

;; Extend margins in prog-mode
(defun my-prog-mode-margins ()
  (interactive)
  (setq left-margin-width 1)
  (setq right-margin-width 1))

(add-hook 'prog-mode-hook #'my-prog-mode-margins)

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
