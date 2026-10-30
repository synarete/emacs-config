;;; appearance-packages.el -- Appearance settings -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto-dim settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-auto-dim-ignore-p (&optional buffer)
  "Return non-nil if BUFFER should never be dimmed."
  (with-current-buffer (or buffer (current-buffer))
    (or (minibufferp)
        (derived-mode-p '(eat-mode
                          eshell-mode
                          help-mode
                          completion-list-mode
                          messages-buffer-mode)))))

(use-package auto-dim-other-buffers
  :ensure t
  :custom-face
  (auto-dim-other-buffers      ((t (:background "#101113"))))
  (auto-dim-other-buffers-hide ((t (:foreground "#101113"
                                                :background "#101113"))))

  :init
  ;; Ignore shell/terminal modes and special buffers from dimming. Not
  ;; via `:hook', which would target a non-existent `...-functions-hook'
  ;; as the variable is unbound until the package loads.
  (add-hook 'auto-dim-other-buffers-never-dim-buffer-functions
            #'my-auto-dim-ignore-p)

  ;; Enable the global mode during idle to keep Emacs startup crisp
  (run-with-idle-timer 1 nil #'auto-dim-other-buffers-mode))


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
  ;; Note: `mode-line' and `mode-line-inactive' are set with the theme below
  :custom-face
  (doom-modeline ((t (:slant normal)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Doom Theme & Refined Faces
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-opera t)

  ;; Enable subtle doom extensions
  (doom-themes-org-config)

  ;; Custom face overrides
  (custom-set-faces
   ;; Background & Highlights
   '(default ((t (:background "#131517"))))
   '(trailing-whitespace ((t (:background "#212123"))))
   '(hl-line ((t (:background "#2d3335"))))

   ;; Line Numbers
   '(line-number ((t (:foreground "#4a4a4a"))))
   '(line-number-current-line ((t (:foreground "#879a87" :weight bold))))

   ;; Vertical Split Divider
   '(vertical-border ((t (:background "#0a0e14" :foreground "#0a0e14"))))

   ;; Mode-line Box & Contrast
   '(mode-line
     ((t (:background "#2e3440"
                      :box (:line-width (2 . 2) :color "#2e3440")
                      :slant normal))))
   '(mode-line-inactive
     ((t (:background "#1c1e20"
                      :box (:line-width (2 . 2) :color "#1c1e20")
                      :foreground "#5c6370" :slant normal))))

   ;; Parentheses
   '(show-paren-match
     ((t (:background "#3f444a" :foreground "#ffffef" :weight bold))))

   ;; Orderless matches in minibuffer completion (no background box)
   '(orderless-match-face-0 ((t (:background unspecified :weight bold))))
   '(orderless-match-face-1 ((t (:background unspecified :weight bold))))
   '(orderless-match-face-2 ((t (:background unspecified :weight bold))))
   '(orderless-match-face-3 ((t (:background unspecified :weight bold))))))
