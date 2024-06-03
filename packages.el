;;; packages.el -- Using extra emacs packages
(message "[ Setup emacs packages for %s ]" (user-login-name))

;;; Package Management
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)


;;; Packages

;; Support buffer auto-completion.
;; https://github.com/company-mode/company-mode
(use-package company
  :ensure t
  :defer 1
  :hook (prog-mode . company-mode))

;; Balance parentheses, brackets, braces, etc.
;; https://github.com/Fuco1/smartparens
(use-package smartparens
  :ensure t
  :defer 1
  :init (require 'smartparens-config)
  :hook (prog-mode . smartparens-mode))

;; Support Emacs key combination tipping.
;; https://github.com/justbur/emacs-which-key
(use-package which-key
  :ensure t
  :defer 1
  :config (which-key-mode))

;; Language Server Protocol
;; https://github.com/emacs-lsp/lsp-mode
(use-package lsp-mode
  :defer 1
  :hook
  (prog-mode . lsp-deferred)
  (lsp-mode . lsp-enable-which-key-integration)
  :init
  (setq lsp-keymap-prefix "C-l")
  :commands lsp lsp-deferred)

(use-package company-lsp
  :after company lsp-mode
  :config
  (add-to-list 'company-backends 'company-lsp))

;; Allow project navigation via treemacs
;; https://github.com/Alexander-Miller/treemacs
(use-package treemacs
  :ensure t
  :defer t
  :config (progn
	    (setq treemacs-no-png-images t
		  treemacs-persist-file nil)))

;; Use Doom-Emacs' themes
;; https://github.com/doomemacs/themes
(use-package doom-themes
  :ensure t
  :defer t
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t))
