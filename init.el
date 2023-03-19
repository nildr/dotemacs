;;; init.el --- Emacs Configuration -*- lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:

;; Initialization file: https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html
;;
;; Modules:
;; 1. Packages: Package initialization
;; 1. Defaults: Generic defaults, diminish, gcmh
;; 2. Behaviour/Completion: Which key, windows and completion framework (vertico, consult, embark, corfu (company), orderless)
;; 3. Programming Languages: Magit, Projectile, Parentheses, Flycheck, Common Lisp, Clojure
;; 4. Prose: org-mode, roam
;; 5. macos: mac defaults
;; 6. Appearance: Themes, fonts, modeline and UI configurations

;;; Code:

;; Add folders to load-path
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Load modules
(require 'init-packages)
(require 'init-defaults)
(require 'init-behaviour)
(require 'init-programming)
(require 'init-prose)
(require 'init-macos)
(require 'init-appearance)

;;; init.el ends here