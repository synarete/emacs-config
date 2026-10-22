;;; init-packages.el -- Bootstrap Emacs Packages -*- lexical-binding: t; -*-

(require 'package)

(setq package-archives
      '(("gnu"          . "https://elpa.gnu.org/packages/")
        ("nongnu"       . "https://elpa.nongnu.org/nongnu/")
        ("melpa"        . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")))

(package-initialize)

;; Fetch package index on fresh installations
(unless package-archive-contents
  (package-refresh-contents))

;; Emacs 30 includes use-package natively
(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t
      use-package-verbose t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; External Packages (Downloaded from MELPA / ELPA)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package auto-dim-other-buffers)
(use-package company)
(use-package doom-modeline)
(use-package doom-themes)
(use-package eat)
(use-package geiser)
(use-package geiser-guile)
(use-package gptel)
(use-package lsp-mode)
(use-package lsp-ui)
(use-package magit)
(use-package projectile)
(use-package smartparens)
(use-package treemacs)
(use-package treemacs-projectile)
(use-package vertico)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Built-in Packages in Emacs 30+
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package autorevert  :ensure nil)
(use-package cc-mode     :ensure nil)
(use-package comint      :ensure nil)
(use-package compile     :ensure nil)
(use-package cua-base    :ensure nil)
(use-package ediff       :ensure nil)
(use-package ffap        :ensure nil)
(use-package flymake     :ensure nil)
(use-package flyspell    :ensure nil)
(use-package frame       :ensure nil)
(use-package gdb-mi      :ensure nil)
(use-package ibuffer     :ensure nil)
(use-package isearch     :ensure nil)
(use-package saveplace   :ensure nil)
(use-package sh-script   :ensure nil)
(use-package text-mode   :ensure nil)
(use-package time        :ensure nil)
(use-package which-key   :ensure nil)
(use-package windmove    :ensure nil)
(use-package xref        :ensure nil)
