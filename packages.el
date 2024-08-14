;;; packages.el -- Using extra emacs packages
(message "[ Setup emacs packages (user: %s) ]" (user-login-name))

;;; Built-in packages

;; Emacs 29.3 and above
(require 'color)
(require 'whitespace)
(require 'cc-mode)
(require 'make-mode)
(require 'sh-script)
(require 'flyspell)
(require 'flymake)
(require 'xref)
(require 'ibuffer)
(require 'gud)
(require 'eldoc)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

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
(use-package magit
  :ensure t
  :defer 2)

;; Highlight indent-guides
;; https://github.com/DarthFennec/highlight-indent-guides
(use-package highlight-indent-guides
  :ensure t
  :defer 1)

;; Beacon
;; https://github.com/Malabarba/beacon
(use-package beacon
  :ensure t
  :defer 1)

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
  :defer 2
  :hook ((c-mode python-mode) . lsp-deferred)
  (lsp-mode . lsp-enable-which-key-integration)
  :init
  (setq lsp-keymap-prefix "C-l")
  :commands lsp lsp-deferred)

;; Use Doom-Emacs' themes
;; https://github.com/doomemacs/themes
(use-package doom-themes
  :ensure t
  :defer 1
  :custom
  (doom-themes-enable-bold nil)
  (doom-themes-enable-italic nil))

;; Projects via projectile
;; https://github.com/bbatsov/projectile
(use-package projectile
  :defer 1
  :demand t
  :config
  (projectile-mode +1))

;; Side project-view and navigation via treemacs
;; https://github.com/Alexander-Miller/treemacs
(use-package treemacs
  :ensure t
  :defer 1
  :config
  (progn
    (setq treemacs-no-png-images t
          treemacs-indentation 1
          treemacs-follow-after-init t
          treemacs-recenter-after-file-follow nil
          treemacs-silent-refresh t
          treemacs-silent-filewatch t
          treemacs-show-hidden-files t
          treemacs-never-persist t)))

(use-package treemacs-projectile
  :defer 2
  :after (treemacs projectile))
