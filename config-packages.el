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
  (setq company-echo-delay 0.3)

  :custom-face
  (company-echo-common ((t (:foreground "#d8dee9"))))
  (company-echo        ((t (:foreground "#b48ead")))))


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

(defun my-eat-face-remap ()
  "Use a darker background in Eat terminal buffers."
  (face-remap-add-relative 'default :background "gray2"))

(use-package eat
  :custom
  (eat-kill-buffer-on-exit t)
  :hook
  (eshell-load . eat-eshell-mode)
  (eat-mode . my-eat-face-remap)
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
;; Magit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-git-commit-mode-hook ()
  "Wrap commit message body at 72 columns."
  (setq-local fill-column 72))

(use-package magit
  :ensure t
  :hook
  (git-commit-mode . my-git-commit-mode-hook)
  :bind
  (("C-c g"   . magit-status)
   ("C-c M-g" . magit-file-dispatch))
  :custom
  (magit-git-executable (or (executable-find "git") "git"))
  (magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  (magit-bury-buffer-function #'magit-restore-window-configuration)
  (magit-save-repository-buffers 'dontask)
  (magit-diff-refine-hunk 'all)
  (git-commit-summary-max-length 50)
  (git-commit-style-convention-checks
   '(non-empty-second-line overlong-summary-line))
  (magit-ediff-dwim-show-on-hunks t)
  (magit-section-initial-visibility-alist
   '((stashes . hide) (untracked . show) (unpushed . show)))
  ;; Mimic git's default terminal colors, using the Tango palette of
  ;; gnome-terminal (new=green, old=red, frag=cyan, meta=bold, commit=yellow)
  :custom-face
  (magit-diff-added
   ((t (:foreground "#4e9a06" :background unspecified))))
  (magit-diff-removed
   ((t (:foreground "#cc0000" :background unspecified))))
  (magit-diff-context
   ((t (:foreground unspecified :background unspecified))))
  (magit-diff-base
   ((t (:foreground unspecified :background unspecified))))
  (magit-diff-added-highlight
   ((t (:foreground "#4e9a06" :background unspecified))))
  (magit-diff-removed-highlight
   ((t (:foreground "#cc0000" :background unspecified))))
  (magit-diff-context-highlight
   ((t (:foreground unspecified :background unspecified))))
  (magit-diff-base-highlight
   ((t (:foreground unspecified :background unspecified))))
  (magit-diff-file-heading
   ((t (:foreground unspecified :weight bold))))
  (magit-diff-file-heading-highlight
   ((t (:foreground unspecified :weight bold))))
  (magit-diff-hunk-heading
   ((t (:foreground "#06989a" :background unspecified))))
  (magit-diff-hunk-heading-highlight
   ((t (:foreground "#06989a" :background unspecified))))
  (magit-diff-whitespace-warning
   ((t (:background "#cc0000"))))
  (magit-hash
   ((t (:foreground "#c4a000"))))
  (magit-section-highlight
   ((t (:background unspecified))))
  (diff-refine-added
   ((t (:foreground "#8ae234" :background unspecified
                                        :inverse-video nil :weight bold))))
  (diff-refine-removed
   ((t (:foreground "#ef2929" :background unspecified
                                        :inverse-video nil :weight bold)))))

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
