;;; navigation.el --- Navigation and Completion Frameworks -*- lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:

;;; Code:
(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.7))

(use-package ace-window
  :bind ("C-w" . ace-window))

(use-package golden-ratio
  :diminish
  :config
  (golden-ratio-mode 1))

(use-package company
  :bind (("TAB" . company-indent-or-complete-common))
  :hook ((prog-mode text-mode) . company-mode)
  :config
  (global-company-mode))

(use-package orderless
    :init
    (setq completion-styles '(orderless))
    (setq completion-category-defaults nil)
    (setq completion-category-overrides '((file (styles . (partial-completion))))))

(use-package vertico
  :init (vertico-mode))

(use-package savehist
  :init (savehist-mode))

(use-package marginalia
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init (marginalia-mode))

(use-package embark
  :bind (("C-." . embark-act)
         ("C-;" . embark-dwim)
         ("C-h B" . embark-bindings))
  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(use-package consult
  :bind (;; C-c bindings (mode-specific-map)
         ("C-c h"   . consult-history)
         ("C-c m"   . consult-mode-command)
         ("C-c k"   . consult-kmacro)
         ;; C-x bindings (ctl-x-map)
         ("C-x M-:" . consult-complex-command)
         ("C-x b"   . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x 5 b" . consult-buffer-other-frame)
         ("C-x r b" . consult-bookmark)
         ("C-x p b" . consult-project-buffer)
         ;; Custom M-# bindings for fast register access
         ("M-#"     . consult-register-load)
         ("M-'"     . consult-register-store)
         ("C-M-#"   . consult-register)
         ;; Other custom bindings
         ("M-y"     . consult-yank-pop)
         ;; M-g bindings (goto-map)
         ("M-g e"   . consult-compile-error)
         ("M-g f"   . consult-flymake)
         ("M-g g"   . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-g o"   . consult-outline)
         ("M-g m"   . consult-mark)
         ("M-g k"   . consult-global-mark)
         ("M-g i"   . consult-imenu)
         ("M-g I"   . consult-imenu-multi)
         ;; M-s bindings (search-map)
         ("M-s d"   . consult-find)
         ("M-s D"   . consult-locate)
         ("M-s g"   . consult-grep)
         ("M-s G"   . consult-git-grep)
         ("M-s r"   . consult-ripgrep)
         ("M-s l"   . consult-line)
         ("C-s"     . consult-line)
         ("M-s L"   . consult-line-multi)
         ("M-s k"   . consult-keep-lines)
         ("M-s u"   . consult-focus-lines)
         ;; Isearch integration
         ("M-s e"   . consult-isearch-history)
         :map       isearch-mode-map
         ("M-e"     . consult-isearch-history)
         ("M-s e"   . consult-isearch-history)
         ("M-s l"   . consult-line)
         ("M-s L"   . consult-line-multi)
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s"     . consult-history)
         ("M-r"     . consult-history))
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)
  (advice-add #'register-preview :override #'consult-register-window)
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)
  :config
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   :preview-key '(:debounce 0.4 any))
  (setq consult-narrow-key "<")
  (autoload 'projectile-project-root "projectile")
  (setq consult-project-function (lambda (_) (projectile-project-root))))

(use-package consult-projectile)

(use-package emacs
  :init
  (setq completion-cycle-threshold 3)
  (setq tab-always-indent 'complete)
  ;; Hide commands in M-x which don't work in the current mode
  (setq read-extended-command-predicate #'command-completion-default-include-p))

(provide 'navigation)
;;; navigation.el ends here
