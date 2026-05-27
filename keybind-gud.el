;;; keybind-gud.el -- Debug key-binding  -*- lexical-binding: t; -*-

(with-eval-after-load 'gud
  (keymap-set gud-mode-map "<up>" #'comint-previous-input)
  (keymap-set gud-mode-map "<down>" #'comint-next-input)
  (keymap-set gud-minor-mode-map "<f5>" #'gud-next)
  (keymap-set gud-minor-mode-map "<f6>" #'gud-step)
  (keymap-set gud-minor-mode-map "<f7>" #'gud-finish))
