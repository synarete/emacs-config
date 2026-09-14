;;; appearance-dim.el  -*- lexical-binding: t; -*-
;; Make other buffer dimmer
(require 'auto-dim-other-buffers)

;; Enable mode globally
(auto-dim-other-buffers-mode 1)
(setq auto-dim-other-buffers-dim-selected t)

(defun my-auto-dim-ignore-shell-p (&optional buffer)
  "Return non-nil if BUFFER (defaults to current) is a shell or terminal mode."
  (with-current-buffer (or buffer (current-buffer))
    (provided-mode-derived-p major-mode 'eat-mode 'eshell-mode 'comint-mode)))

(defun my-setup-auto-dim-face ()
  "Darker background color for non-active buffers."
  (let* ((current-bg (face-background 'default nil t))
         (darkened-bg (color-darken-name current-bg 10)))
    (face-spec-set 'auto-dim-other-buffers-face
                   `((t :background ,darkened-bg)))))

(add-hook 'auto-dim-other-buffers-never-dim-buffer-functions
            #'my-auto-dim-ignore-shell-p)
(add-hook 'after-init-hook #'my-setup-auto-dim-face)
