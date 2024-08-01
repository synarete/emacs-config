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

;; Use indentation-guides
(defun my-highlight-indent-guides ()
  (progn
    (highlight-indent-guides-mode)
    (set-face-background 'highlight-indent-guides-odd-face "#16181A")
    (set-face-background 'highlight-indent-guides-even-face "#181A1C")
    (set-face-foreground 'highlight-indent-guides-character-face "010101")))

(add-hook 'prog-mode-hook 'my-highlight-indent-guides)

