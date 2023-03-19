;;; early-init.el --- Early Init File  -*- lexical-binding: t; no-byte-compile: t-*-
;;; Commentary:
;;; Early Init File: https://www.gnu.org/software/emacs/manual/html_node/emacs/Early-Init-File.html

;;; Code:
;; Increase garbage collector threshold
(setq gc-cons-threshold (* 128 1024 1024))
;; Increase the amount of data reads from the process
(setq read-process-output-max (* 1024 1024))
;; Don't compact font caches during GC
(setq inhibit-compacting-font-caches t)

;; No toolbar
(tool-bar-mode -1)
;; No scrollbar
(scroll-bar-mode -1)
;; No tooltips
(tooltip-mode -1)

;; No startup screen
(setq inhibit-splash-screen t)
;; No scratch message
(setq initial-scratch-message "")
;; No echo area message
(setq inhibit-startup-echo-area-message t)

;; Frames
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(width . 200))
(add-to-list 'default-frame-alist '(height . 90))
(setq frame-title-format '("%b"))
(setq ns-use-proxy-icon nil)
(setq frame-inhibit-implied-resize t)
(setq frame-resize-pixelwise t)

;; Don't use file dialog
(setq use-file-dialog nil)

;; Keep backup files in a dedicated directory
(setq backup-directory-alist
      `((".*" . ,(concat user-emacs-directory "backups")))
      auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
;; Don't need lockfiles
(setq create-lockfiles nil)
;; Move to trash rather than delete
(setq delete-by-moving-to-trash t)

;; Ignore X
(advice-add #'x-apply-session-resources :override #'ignore)

;; Write customizations in 'custom.el' file
(setq custom-file (locate-user-emacs-file "custom.el"))

;; Less noise when compiling elisp
(setq byte-compile-warnings '(not free-vars unresolved noruntime lexical make-local))
(setq native-comp-async-report-warnings-errors 'silent)
(setq load-prefer-newer t)

;;; early-init.el ends here
