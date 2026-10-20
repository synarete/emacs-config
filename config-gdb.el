;;; config-gdb.el -- Debug (GDB) configuration -*- lexical-binding: t; -*-

(defun my-gdb-mode-hook ()
  "Add extra space before line-number for GDB pos indicator."
  (setq-local display-line-numbers-width 5))

(defun my-gdb ()
  "Launch GDB from the current project root directory."
  (interactive)
  (let ((default-directory
         (if-let ((proj (project-current)))
             (project-root proj)
           default-directory)))
    (call-interactively #'gdb)))

(use-package gdb-mi
  :ensure nil
  :defer t
  :custom
  (gdb-show-main t)
  (gdb-display-io-nopopup t)
  (gdb-non-stop-setting nil)
  (gdb-restore-window-configuration-after-quit t)
  (gdb-many-windows nil)

  :hook
  (gdb-mode . my-gdb-mode-hook)

  :bind
  (:map gud-mode-map
        ("<up>"   . comint-previous-input)
        ("<down>" . comint-next-input))
  (:map gud-minor-mode-map
        ("<f5>" . gud-next)
        ("<f6>" . gud-step)
        ("<f7>" . gud-finish)))
