;;; config-prog.el -- Programming settings -*- lexical-binding: t; -*-

;;;; Programming configs

;; Display line numbers
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Display column numbers
(add-hook 'prog-mode-hook #'column-number-mode)

;; Display column-indicator (default: 80)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; Remove trailing whitespaces upon save
(defun my-prog-mode-save-hook ()
  (unless (memq #'delete-trailing-whitespace before-save-hook)
    (add-hook 'before-save-hook #'delete-trailing-whitespace nil t))
  (unless (memq #'whitespace-cleanup before-save-hook)
    (add-hook 'before-save-hook #'whitespace-cleanup nil t)))

(add-hook 'prog-mode-hook #'my-prog-mode-save-hook)

;; Coding-style
(defconst my-c-default-style
  '((cc-mode . "linux")
    (python-mode . "python")
    (awk-mode . "awk")
    (java-mode . "java")
    (other . "gnu")))

(setq c-default-style my-c-default-style)

;; C style
(defun my-c-mode-style-hook ()
  (c-set-style "linux")
  (setq-local c-indent-level 8)
  (setq-local tab-always-indent t)
  (setq-local tab-width 8))

(add-hook 'c-mode-common-hook #'my-c-mode-style-hook)

;; C23 missing
(defun my-c23-keywords-hook ()
  "Add C23 keywords to font-lock for C mode."
  (let ((c23-kw (regexp-opt '("alignas" "alignof" "bool" "constexpr"
                              "false" "nullptr" "static_assert" "thread_local"
                              "true" "typeof" "typeof_unqual") 'symbols))
        (c23-tp (regexp-opt '("_BitInt" "_Decimal32" "_Decimal64"
                              "_Decimal128") 'symbols)))
    (font-lock-add-keywords nil
                            `((,c23-kw . font-lock-keyword-face)
                              (,c23-tp . font-lock-type-face)))))

(add-hook 'c-mode-hook #'my-c23-keywords-hook)

;; Scheme
(when-let ((guile-path (executable-find "guile3.0")))
  (setq geiser-guile-binary guile-path))


