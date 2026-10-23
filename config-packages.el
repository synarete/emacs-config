;;; config-packages.el -- Packages settings -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Where to find packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Company settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package company
  :ensure t
  :hook
  (prog-mode . company-mode)
  :custom
  (company-frontends '(company-echo-metadata-frontend
                       company-echo-frontend))
  :config
  (setq company-echo-delay 0.3))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flyspell settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-spell-checker-p ()
  "Return non-nil if a spell checker program is installed."
  (require 'ispell)
  (executable-find ispell-program-name))

(defun my-flyspell-prog-mode ()
  "Enable `flyspell-prog-mode' if a spell checker is installed."
  (when (my-spell-checker-p)
    (flyspell-prog-mode)))

(defun my-flyspell-mode ()
  "Enable `flyspell-mode' if a spell checker is installed."
  (when (my-spell-checker-p)
    (flyspell-mode 1)))

(use-package flyspell
  :ensure nil
  :hook ((prog-mode . my-flyspell-prog-mode)
         (text-mode . my-flyspell-mode)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Eat terminal settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-toggle-shell ()
  "Toggle the Eat shell buffer."
  (interactive)
  (if (derived-mode-p 'eat-mode)
      (bury-buffer)
    (eat)))

(use-package eat
  :custom
  (eat-kill-buffer-on-exit t)
  :hook
  (eshell-load . eat-eshell-mode)
  :bind
  ("<f4>" . my-toggle-shell))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Vertico settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package vertico
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode 1))

(use-package savehist
  :ensure nil
  :init
  (savehist-mode 1))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Treemacs settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package treemacs
  :ensure t
  :custom
  (treemacs-no-png-images t)
  (treemacs-indentation 1)
  (treemacs-follow-after-init t)
  (treemacs-silent-refresh t)
  (treemacs-silent-filewatch t)
  (treemacs-width 30)
  :config
  (set-face-attribute 'treemacs-root-face nil :height 1.0)
  :bind
  ("<f1>" . treemacs)
  (:map treemacs-mode-map
        ([mouse-3] . nil)
        ([down-mouse-3] . nil)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Projectile
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-projectile--make (&optional target)
  "Run `make' with optional TARGET at the projectile root."
  (let ((default-directory (or (projectile-project-root) default-directory)))
    (compile (if target (concat "make " target) "make"))))

(defun my-projectile-compile ()
  "Run `make' at the projectile root without prompting."
  (interactive)
  (my-projectile--make))

(defun my-projectile-compile-clean ()
  "Run `make clean' at the projectile root without prompting."
  (interactive)
  (my-projectile--make "clean"))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :bind
  ("<f3>"   . my-projectile-compile)
  ("C-<f3>" . my-projectile-compile-clean))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Geiser and Guile settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package geiser
  :ensure t
  :defer t
  :custom
  (geiser-active-implementations '(guile))
  (geiser-repl-history-size 1000)
  (geiser-autodoc-delay 0.2))

(use-package geiser-guile
  :ensure t
  :defer t
  :custom
  (geiser-guile-binary (or (executable-find "guile3.0") "guile")))
