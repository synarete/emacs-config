;;;; Command-interpreter (Shell and Term)
(require 'comint)

;; Avoid input duplicates
(setq comint-input-ignoredups t)

;; Move cursor to end-of-buffer upon input
(setq comint-move-point-for-output t)

;; Echo input
(setq comint-process-echoes t)

;; Do not allow erase prompt
(setq comint-prompt-read-only t)

;; Auto scroll
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-scroll-show-maximum-output t)

;; Use pretty colors in comint-mode
(ansi-color-for-comint-mode-on)

