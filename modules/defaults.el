;;; defaults.el --- Generic defaults -*- lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:

;;; Code:
(require 'frames)

;; Defaults
(use-package emacs
  :bind (("<escape>" . keyboard-escape-quit)
				 ("<s-up>"        . beginning-of-buffer)
	       ("<s-down>"      . end-of-buffer)
	       ("<s-left>"      . move-beginning-of-line)
	       ("<s-right>"     . move-end-of-line)
	       ("s-+"           . text-scale-increase)
	       ("s--"           . text-scale-decrease)
	       ("<M-up>"        . backward-paragraph)
	       ("<M-down>"      . forware-paragraph)
	       ("M-<backspace>" . backward-kill-word)
	       ("s-w"           . kill-this-buffer)
	       ("s-a"           . mark-whole-buffer)
	       ("s-c"           . kill-ring-save)
	       ("s-v"           . yank)
	       ("s-x"           . kill-region)
	       ("s-s"           . save-buffer)
	       ("s-l"           . goto-line)
	       ("s-w"           . kill-this-buffer)
	       ("s-z"           . undo))
  :init
  (setq user-full-name "Nicola Di Bernardo")

  ;; Default coding
  (set-default-coding-systems 'utf-8)
	;; Center the frame
  (when window-system
    (ndb/frame-center))
	;; y-or-n
  (defalias 'yes-or-no-p 'y-or-n-p)

	(server-start))

(use-package diminish)

(use-package gcmh
  :diminish
  :config
  (gcmh-mode 1))

(provide 'defaults)
;;; defaults.el ends here
