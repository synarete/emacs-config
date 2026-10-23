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

   ;; Line Numbers (Using HEX for cross-platform consistency)
   '(line-number ((t (:foreground "#4a4a4a"))))
   '(line-number-current-line ((t (:foreground "#879a87" :weight bold))))

   ;; Vertical Split Divider
   '(vertical-border ((t (:background "#0a0e14" :foreground "#0a0e14"))))

   ;; Mode-line Box & Contrast
   '(mode-line
     ((t (:background "#2e3440"
                      :box (:line-width (2 . 2) :color "#2e3440")
                      ))))
   '(mode-line-inactive
     ((t (:background "#1c1e20"
                      :box (:line-width (2 . 2) :color "#1c1e20")
                      :foreground "#5c6370"))))

   ;; Parentheses
   '(show-paren-match
     ((t (:background "#3f444a" :foreground "#ffffef" :weight bold))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Company and Eat faces
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package company
  :defer t
  :custom-face
  (company-echo-common ((t (:foreground "#d8dee9"))))
  (company-echo        ((t (:foreground "#b48ead")))))

(defun my-eat-face-remap ()
  "Use a darker background in Eat terminal buffers."
  (face-remap-add-relative 'default :background "gray2"))

(use-package eat
  :hook
  (eat-mode . my-eat-face-remap))
