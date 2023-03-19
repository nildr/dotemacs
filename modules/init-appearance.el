;;; init-appearance.el --- Themes and appearance -*- lexical-binding: t;  no-byte-compile: t -*-
;;; Commentary:

;;; Code:
(require 'fonts)

;; Kaolin: https://github.com/ogdenwebb/emacs-kaolin-themes
(use-package kaolin-themes
  :config (load-theme 'kaolin-dark t))

;; Icons
(use-package all-the-icons)

;; A fancy modeline: https://github.com/seagle0128/doom-modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1))

(use-package emacs
  :hook (prog-mode . display-line-numbers-mode)
  :init
  ;;Set font
  (set-face-attribute 'default nil
                      :font (ndb/font '("PragmataPro" "JetBrains Mono" "Fira Code" "Menlo"))
                      :height 130)
  ;; Set fringe size
  (set-fringe-mode 10)
  ;; Display current column
  (column-number-mode)
  ;; Highlight current line
  (global-hl-line-mode 1)
  ;; Highlight matching pairs of parentheses
  (show-paren-mode))

(provide 'init-appearance)
;;; init-appearance.el ends here
