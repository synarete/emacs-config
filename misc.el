;;; misc.el -- Update emacs appearance and theme
(message "[ Misc emacs settings (user: %s) ]" (user-login-name))

;; Beaconize active position
(beacon-mode 1)

;; Make active buffer a bit darker
(defun my-not-a-special-window (w)
  (not (string-prefix-p "*" (buffer-name (window-buffer w)))))

(defun my-update-window-buffer-face (w darker)
  (if (eq darker t)
      (with-current-buffer (window-buffer w)
        (buffer-face-set '(:background "gray5")))
    (with-current-buffer (window-buffer w)
      (buffer-face-set '(:background "gray7")))))

(defun my-highlight-active-buffer ()
  (walk-windows
   (lambda (w)
     (when (my-not-a-special-window w)
       (if (eq w (selected-window))
           (my-update-window-buffer-face w t)
         (my-update-window-buffer-face w nil))))))

(add-hook 'buffer-list-update-hook 'my-highlight-active-buffer)
