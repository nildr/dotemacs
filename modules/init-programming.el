;;; init-programming.el --- Programming languages configurations -*- lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:

;;; Code:
(use-package emacs
  :hook ((prog-mode . (lambda () (setq show-trailing-whitespace t)))
         (prog-mode . display-line-numbers-mode))
  :init
  ;; Column size
  (setq-default fill-column 80)
  ;; Tab width
  (setq-default tab-width 2)
  ;; No tabs
  (setq-default indent-tabs-mode nil))

;;; Git
(use-package magit
  :bind (("C-x g"   . magit-status)
         ("C-x C-g" . magit-status)))

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
  :diminish
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

;; Docker
(use-package dockerfile-mode
  :mode ("Dockerfile\\'" . dockerfile-mode))

;;; Common Lisp
(use-package slime
  :config
  (progn
    (load (expand-file-name "~/.quicklisp/slime-helper.el"))
    (push 'slime-indentation slime-contribs)
    (setq inferior-lisp-program "sbcl")))

;;; Clojure
(use-package clojure-mode
  :mode (("\\.clj\\'"  . clojure-mode)
        ("\\.boot\\'" . clojure-mode)
        ("\\.edn\\'"  . clojure-mode))
  :bind (:map clojure-mode-map
              ("<s-return>"   . cider-eval-last-sexp)
              ("<S-s-return>" . cider-eval-defun-at-point)
              ("<C-s-return>" . cider-eval-buffer)
              ("<M-.>"        . cider-find-var))
  :config
  (require 'flycheck-clj-kondo))

(use-package cider
  :hook (((cider-repl-mode) . cider-mode)
         ((cider-mode cider-interaction-mode) . eldoc-mode))
  :init
  (setq cider-repl-use-clojure-font-lock t
        cider-overlays-use-font-lock t
        cider-prompt-save-file-on-load 'always-save
        cider-font-lock-dynamically '(macro core function var deprecated)
        cider-use-overlays t
        cider-repl-pop-to-buffer-on-connect 'display-only
        cider-repl-use-pretty-printing t
        nrepl-hide-special-buffers t
        nrepl-log-messages t
        nrepl-use-ssh-fallback-for-remote-hosts t))

(use-package cider-eval-sexp-fu
  :init (setq cider-eval-sexp-fu-flash-duration 0.2))

(use-package clj-refactor
  :hook (cider-mode . clj-refactor-mode)
  :diminish clj-refactor-mode
  :config (cljr-add-keybindings-with-prefix "C-c C-m"))

;; LSP
(use-package lsp-mode
  :hook (((clojure-mode clojurescript-mode clojurec-mode) . lsp))
  :config
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-modeline-code-actions-enable nil))

(use-package lsp-treemacs)

(use-package lsp-ui)

;; JVM
(use-package jvm-mode
  :config
  (setq jvm-mode-line-string " jvm[%d]")
  (jvm-mode))

(provide 'init-programming)
;;; init-programming.el ends here
