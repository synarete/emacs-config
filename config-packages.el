;;; config-packages.el -- Packages settings -*- lexical-binding: t; -*-

;; Where to find packages
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))


;; Company settings
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

;; Flyspell settings
(use-package flyspell
  :ensure nil
  :hook ((prog-mode . flyspell-prog-mode)
         (text-mode . flyspell-mode)))
