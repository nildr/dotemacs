;;; languages.el --- Languages configurations -*- lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:

;;; Code:

;; Docker
(use-package dockerfile-mode
  :mode ("Dockerfile\\'" . dockerfile-mode))

;; LSP
(use-package lsp-mode
  :hook (((clojure-mode clojurescript-mode clojurec-mode) . lsp))
  :config
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-modeline-code-actions-enable nil))

(use-package lsp-treemacs)

(use-package lsp-ui)

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

;; JVM
(use-package jvm-mode
  :config
  (setq jvm-mode-line-string " jvm[%d]")
  (jvm-mode))

(provide 'languages)
;;; languages.el ends here
