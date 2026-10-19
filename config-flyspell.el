;;; config-flyspell.el -- Flyspell settings -*- lexical-binding: t; -*-

(use-package flyspell
  :ensure nil
  :hook ((prog-mode . flyspell-prog-mode)
         (text-mode . flyspell-mode)))
