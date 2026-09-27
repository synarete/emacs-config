;;; appearance-dim.el  -*- lexical-binding: t; -*-
(require 'auto-dim-other-buffers)

;; Hardcode the background colors
(set-face-attribute 'default nil :background "#131517")
(set-face-attribute 'auto-dim-other-buffers-face nil :background "#101113")

;; Keep the active/selected buffer bright, dim the others
(setq auto-dim-other-buffers-dim-selected nil)

(defun my-auto-dim-ignore-shell-p (&optional buffer)
  "Return non-nil if BUFFER (defaults to current) is a shell or terminal mode."
  (with-current-buffer (or buffer (current-buffer))
    (provided-mode-derived-p major-mode 'eat-mode 'eshell-mode)))

(add-hook 'auto-dim-other-buffers-never-dim-buffer-functions
          #'my-auto-dim-ignore-shell-p)

(auto-dim-other-buffers-mode 1)
