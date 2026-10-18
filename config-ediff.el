;;; config-ediff.el -- Ediff configurations -*- lexical-binding: t; -*-
  
(use-package ediff
  :defer t
  :custom
  ;; Frame and window layout
  (ediff-window-setup-function 'ediff-setup-windows-plain)
  (ediff-split-window-function 'split-window-horizontally)
  
  ;; UI and display options
  (ediff-show-registry-before-ediff-regime nil)
  (ediff-highlight-all-current-diffs t)
  
  ;; Diff behavior
  (ediff-ignore-similar-regions t)
  (ediff-keep-variants nil)
  (ediff-show-ancestor t)
  
  :config
  ;; Restore previous layout upon exiting ediff
  (when (fboundp 'winner-mode)
    (winner-mode 1)
    (add-hook 'ediff-after-quit-hook-internal #'winner-undo)))
