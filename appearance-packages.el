;;; appearance-packages.el -- Appearance settings -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Magit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package magit
  :ensure t
  :config
  (custom-theme-set-faces
   'user
   '(magit-diff-added             ((t (:background unspecified))))
   '(magit-diff-removed           ((t (:background unspecified))))
   '(magit-diff-context           ((t (:background unspecified))))
   '(magit-diff-base              ((t (:background unspecified))))
   '(magit-diff-added-highlight   ((t (:background unspecified))))
   '(magit-diff-removed-highlight ((t (:background unspecified))))
   '(magit-diff-context-highlight ((t (:background unspecified))))
   '(magit-diff-base-highlight    ((t (:background unspecified))))
   '(magit-section-highlight      ((t (:background unspecified))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto-dimm settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-auto-dim-ignore-p (&optional buffer)
  "Return non-nil if BUFFER should never be dimmed."
  (with-current-buffer (or buffer (current-buffer))
    (or (minibufferp)
        (provided-mode-derived-p major-mode 'eat-mode 'eshell-mode)
        (derived-mode-p 'help-mode
                        'completion-list-mode
                        'messages-buffer-mode))))

(defun my-apply-auto-dim-face-colors (&rest _)
  "Ensure face attributes persist even after loading a new theme."
  (set-face-attribute 'default nil :background "#131517")
  (set-face-attribute 'auto-dim-other-buffers-face nil :background "#101113"))

(use-package auto-dim-other-buffers
  :ensure t
  :custom
  ;; Keep the active/selected buffer bright, dim the others
  (auto-dim-other-buffers-dim-selected nil)

  :hook
  ;; Ignore shell/terminal modes and special buffers from dimming
  (auto-dim-other-buffers-never-dim-buffer-functions . my-auto-dim-ignore-p)

  :init
  ;; Enable the global mode during idle to keep Emacs startup crisp
  (run-with-idle-timer 1 nil #'auto-dim-other-buffers-mode)

  :config
  ;; Apply background face colors initially
  (my-apply-auto-dim-face-colors)

  ;; Re-apply background colors automatically if you switch themes
  (advice-add 'load-theme :after #'my-apply-auto-dim-face-colors))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Doom mode-line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-bar-width 0)
  (doom-modeline-buffer-file-name-style 'relative-to-project)
  (doom-modeline-icon nil)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-time-icon nil)
  (doom-modeline-time-live-icon nil)
  (doom-modeline-battery nil)
  (doom-modeline-env-version nil)
  :custom-face
  (mode-line ((t (:slant normal))))
  (mode-line-inactive ((t (:slant normal))))
  (doom-modeline ((t (:slant normal)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Doom theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-opera t))
