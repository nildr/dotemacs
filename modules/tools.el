;;; tools.el --- Tools configurations -*- lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:

;;; Code:
;;; Git
(use-package magit
  :bind (("C-x g"   . magit-status)
         ("C-x C-g" . magit-status)))

;; A good terminal emulation
(use-package vterm)

(use-package vterm-toggle
  :commands (vterm-toggle)
  :custom
  (vterm-toggle-fullscreen-p nil "Open a vterm in another window.")
  (vterm-toggle-scope 'project)
  :bind (("C-c s" . #'vterm-toggle)))

;;; Projectile
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Workspace/")
    (setq projectile-project-search-path '("~/Workspace/")))
  (setq projectile-switch-project-action #'projectile-dired))

;;; "If you think paredit is not for you, then you need to become the kind of person that paredit is for".
(use-package paredit
  :diminish paredit-mode " π "
  :hook ((emacs-lisp-mode lisp-mode clojure-mode clojurescript-mode) . paredit-mode)
  :bind (:map paredit-mode-map
              ("M-<up>"      . nil)
              ("M-<down>"    . nil)
              ("M-s"         . nil)
              ("M-q"         . paredit-splice-sexp)
              ("C-M-<left>"  . backward-sexp)
              ("C-M-<right>" . forward-sexp)
              ("M-("         . paredit-wrap-round)
              ("M-["         . paredit-wrap-square)
              ("M-{"         . paredit-wrap-curly)
              ("M-)"         . paredit-close-round-and-newline)
              ("M-]"         . paredit-close-square-and-newline)
              ("M-}"         . paredit-close-curly-and-newline)))

(use-package eldoc
  :diminish)

;;; Syntax Checking
(use-package flycheck
  :init
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (global-flycheck-mode))

(use-package flycheck-clj-kondo)

(provide 'tools)
;;; tools.el ends here
