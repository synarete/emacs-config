;;; packages.el -- Default packages settings -*- lexical-binding: t; -*-

;;; Built-in packages

;; Emacs 29.3 and above
(require 'color)
(require 'whitespace)
(require 'cc-mode)
(require 'make-mode)
(require 'sh-script)
(require 'xref)
(require 'bind-key)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

;;; Extra packages

;; Support buffer auto-completion.
;; https://github.com/company-mode/company-mode
(use-package company
  :ensure t
  :defer t)

;; Balance parentheses, brackets, braces, etc.
;; https://github.com/Fuco1/smartparens
(use-package smartparens
  :ensure smartparens
  :defer t)

;; Support Emacs key combination tipping.
;; https://github.com/justbur/emacs-which-key
(use-package which-key
  :ensure t
  :defer t)

;; Git via magit
;; https://magit.vc/
;; (use-package magit
;;  :ensure t
;;  :defer 2)

;; Scheme/Guile development
;; https://www.nongnu.org/geiser/
(use-package geiser
  :ensure t
  :defer t)

(use-package geiser-guile
  :ensure t
  :defer t)

;; LSP (Language Server Protocol)
;; https://github.com/emacs-lsp/lsp-mode
(use-package lsp-mode
  :ensure t
  :defer t
  :hook ((c-mode python-mode) . lsp-deferred)
  :commands lsp lsp-deferred)

;; LSP UI
;; https://github.com/emacs-lsp/lsp-ui
(use-package lsp-ui
  :ensure t
  :defer t)

;; Projects via projectile
;; https://github.com/bbatsov/projectile
(use-package projectile
  :demand t
  :config
  (projectile-mode +1))

;; Project-view via treemacs
;; https://github.com/Alexander-Miller/treemacs
(use-package treemacs
  :ensure t
  :config
  (treemacs-filewatch-mode t))

(use-package treemacs-projectile
  :after (treemacs projectile))

;; GNU flymake
(use-package flymake
  :ensure t
  :defer t)

;; Spell check with flyspell
(use-package flyspell
  :ensure t
  :defer t)

;; Use Vertico as completion framework
;; https://github.com/minad/vertico
(use-package vertico
  :ensure t
  :init (vertico-mode))

;; Use Doom emacs themes
;; https://github.com/doomemacs/themes
(use-package doom-themes
  :ensure t
  :defer t
  :custom
  (doom-themes-enable-bold nil)
  (doom-themes-enable-italic nil))

;; Use Doom emacs mode-line
;; https://github.com/seagle0128/doom-modeline
(use-package doom-modeline
  :ensure t
  :defer t)
