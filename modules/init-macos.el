;;; init-macos.el --- macOs Integration -*- lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:

;;; Code:
(use-package emacs
  :init
  (when (eq system-type 'darwin)
    (setq mac-emulate-three-button-mouse t)
    (setq mac-option-modifier 'meta)
    (setq mac-command-modifier 'super)
    (setq shift-select-mode t)
    (delete-selection-mode t)))

(provide 'init-macos)
;;; init-macos.el ends here
