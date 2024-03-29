;;; prose.el --- Prose configurations -*- lexical-binding: t;  no-byte-compile: t -*-
;;; Commentary:

;;; Code:
;; Org
(use-package org)

(use-package org-modern
  :config
  (global-org-modern-mode))

(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Notes")
  (org-roam-complete-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toogle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i"   . completion-at-point))
  :config (org-roam-setup))

;; Markdown
(use-package markdown-mode
  :mode "\\.md\\'")

;; Yaml
(use-package yaml-mode)

(provide 'prose)
;;; prose.el ends here
