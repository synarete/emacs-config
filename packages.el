;;; packages.el -- Default packages settings -*- lexical-binding: t; -*-

;;; Built-in packages

;; Emacs 29.3 and above
(require 'color)
(require 'whitespace)
(require 'cc-mode)
(require 'make-mode)
(require 'sh-script)
(require 'xref)
;; (require 'eglot)
;; (require 'eldoc)
(require 'bind-key)
(require 'package)

(add-to-list
 'package-archives
 '("melpa" . "https://melpa.org/packages/")
 '("melpa-stable" . "https://stable.melpa.org/packages/"))
(when (< emacs-major-version 27)
  (package-initialize))


;;; Extra packages

;; Support buffer auto-completion.
;; https://github.com/company-mode/company-mode
(use-package company
  :ensure t
  :defer 1
  :hook (prog-mode . company-mode))

;; Balance parentheses, brackets, braces, etc.
;; https://github.com/Fuco1/smartparens
(use-package smartparens
  :ensure smartparens
  :defer 1)

;; Support Emacs key combination tipping.
;; https://github.com/justbur/emacs-which-key
(use-package which-key
  :ensure t
  :defer 1
  :config (which-key-mode))

;; Git via magit
;; https://magit.vc/
;; (use-package magit
;;  :ensure t
;;  :defer 2)

;; Scheme/Guile development
;; https://www.nongnu.org/geiser/
(use-package geiser
  :ensure t
  :defer 2)

(use-package geiser-guile
  :ensure t
  :defer 2)

;; Language Server Protocol
;; https://github.com/emacs-lsp/lsp-mode
(use-package lsp-mode
  :ensure t
  :defer 2
  :hook ((c-mode python-mode) . lsp-deferred)
  :commands lsp lsp-deferred)

;; Projects via projectile
;; https://github.com/bbatsov/projectile
(use-package projectile
  :defer 1
  :demand t
  :config
  (projectile-mode +1))

;; Project-view via treemacs
;; https://github.com/Alexander-Miller/treemacs
(use-package treemacs
  :ensure t
  :defer 1
  :config
  (progn
    (setq treemacs-no-png-images t)
    ;; (setq treemacs-width 40)
    (setq treemacs-indentation 1)
    (setq treemacs-follow-after-init t)
    (setq treemacs-recenter-after-file-follow nil)
    (setq treemacs-silent-refresh t)
    (setq treemacs-silent-filewatch t)
    (setq treemacs-show-hidden-files t)
    (setq treemacs-never-persist t)
    (treemacs-filewatch-mode t)
    (set-face-attribute 'treemacs-root-face nil :height 1.0)
    ))

(use-package treemacs-projectile
  :defer 2
  :after (treemacs projectile))

;; GNU flymake
(use-package flymake
  :ensure t
  :defer 2)

;; Spell check with flyspell
(use-package flyspell
  :ensure t
  :defer 2)

;; Use Doom emacs themes
;; https://github.com/doomemacs/themes
(use-package doom-themes
  :ensure t
  :defer 1
  :custom
  (doom-themes-enable-bold nil)
  (doom-themes-enable-italic nil))

;; Use Doom emacs mode-line
;; https://github.com/seagle0128/doom-modeline
(use-package doom-modeline
  :ensure t
  :defer 1)
