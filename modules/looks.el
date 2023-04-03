;;; looks.el --- Themes and appearance -*- lexical-binding: t;  no-byte-compile: t -*-
;;; Commentary:

;;; Code:
(require 'fonts)

;; Kaolin: https://github.com/ogdenwebb/emacs-kaolin-themes
(use-package kaolin-themes
  :disabled
  :config (load-theme 'kaolin-dark t))

(use-package autothemer
  :disabled
  :init
  (add-to-list
   'custom-theme-load-path
   (concat user-emacs-directory "themes/"))
  :config
  (load-theme 'kanagawa t))

(use-package doom-themes
  :config
  (load-theme 'doom-monokai-octagon t))

;; Icons
(use-package all-the-icons)

;; A fancy modeline: https://github.com/seagle0128/doom-modeline
(use-package doom-modeline
  :custom
  (doom-modeline-icon nil)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-height 25)
  :init (doom-modeline-mode 1))

(use-package emacs
  :hook ((prog-mode . (lambda () (setq show-trailing-whitespace t)))
          (prog-mode . display-line-numbers-mode))
  :init
  ;;Set font
  (set-face-attribute 'default nil
                      :font (ndb/font '("JetBrains Mono" "Fira Code" "Menlo"))
                      :height 120)
  ;; Set fringe size
  (set-fringe-mode 10)
  ;; Display current column
  (column-number-mode)
  ;; Highlight current line
  (global-hl-line-mode 1)
  ;; Highlight matching pairs of parentheses
  (show-paren-mode)
  ;; Column size
  (setq-default fill-column 80)
  ;; Tab width
  (setq-default tab-width 2)
  ;; No tabs
  (setq-default indent-tabs-mode nil))

(provide 'looks)
;;; looks.el ends here
