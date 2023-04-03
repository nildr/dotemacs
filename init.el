;;; init.el --- Emacs Configuration -*- lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:

;; Initialization file: https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html
;;
;; Modules:
;; 1. Packages: Package initialization
;; 2. Defaults: Generic defaults, diminish, gcmh
;; 3. Navigation/Completion: Which key, windows and completion framework (vertico, consult, embark, corfu (company), orderless)
;; 4. Tools: Magit, Projectile, Parentheses, Flycheck
;; 5. Languages: Common Lisp, Clojure
;; 6. Prose: org-mode, roam
;; 7. macos: mac defaults
;; 8. Looks: Themes, fonts, modeline and UI configurations

;;; Code:

;; Add folders to load-path
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Load modules
(require 'packages)
(require 'defaults)
(require 'navigation)
(require 'tools)
(require 'languages)
(require 'prose)
(require 'macos)
(require 'looks)

;;; init.el ends here
