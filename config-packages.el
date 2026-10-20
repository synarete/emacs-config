;;; config-packages.el -- Packages settings -*- lexical-binding: t; -*-

;; Where to find packages
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))


;; =============================================================================
;; Company settings
;; =============================================================================
(use-package company
  :ensure t
  :hook
  (prog-mode . company-mode)
  :custom
  (company-echo-delay 0.3)
  (company-frontends '(company-echo-metadata-frontend
                       company-echo-frontend))
  :custom-face
  (company-echo-common ((t (:foreground "#d8dee9"))))
  (company-echo        ((t (:foreground "#b48ead")))))

;; =============================================================================
;; Flyspell settings
;; =============================================================================
(use-package flyspell
  :ensure nil
  :hook ((prog-mode . flyspell-prog-mode)
         (text-mode . flyspell-mode)))

;; =============================================================================
;; Eat terminal settings
;; =============================================================================
(use-package eat
  :custom
  (eat-kill-buffer-on-exit t)
  :hook
  (eshell-load . eat-eshell-mode))

;; =============================================================================
;; Vertico settings
;; =============================================================================
(use-package vertico
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode 1))

;; =============================================================================
;; Treemacs settings
;; =============================================================================
(use-package treemacs
  :ensure t
  :custom
  (treemacs-no-png-images t)
  (treemacs-indentation 1)
  (treemacs-follow-after-init t)
  (treemacs-recenter-after-file-follow nil)
  (treemacs-silent-refresh t)
  (treemacs-silent-filewatch t)
  (treemacs-show-hidden-files t)
  (treemacs-never-persist t)
  (treemacs-is-never-other-window nil)
  (treemacs-width 30)
  :config
  (set-face-attribute 'treemacs-root-face nil :height 1.0)
  :bind
  (:map treemacs-mode-map
        ([mouse-3] . nil)
        ([down-mouse-3] . nil)))
