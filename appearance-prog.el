;;; appearance-prog.el  -*- lexical-binding: t; -*-

;;;; Prog-mode visuals

;; Whitespaces
(defun my-whitespace-style ()
  (progn
    (setq-local show-trailing-whitespace t)
    ;;(setq whitespace-style '(face empty trailing tab-mark))
    (setq-local whitespace-display-mappings
          '(
            ;; (space-mark 32 [183] [46])
            (tab-mark 9 [187 9] [92 9])
            ))
    (set-face-attribute 'whitespace-tab nil
                        :background 'unspecified
                        :foreground "gray19")
    (set-face-attribute 'whitespace-space nil
                        :background 'unspecified
                        :foreground "gray19")
    (set-face-attribute 'whitespace-space-after-tab nil
                        :background 'unspecified
                        :foreground "gray19")
    (whitespace-mode)))

(add-hook 'prog-mode-hook #'my-whitespace-style)

;; Highlight line
;; (add-hook 'prog-mode-hook #'hl-line-mode)

;; Company
(with-eval-after-load 'company
  (set-face-attribute 'company-echo-common nil :foreground "#d8dee9")
  (set-face-attribute 'company-echo nil :foreground "#b48ead"))
