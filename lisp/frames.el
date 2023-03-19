;;; frames.el --- Frames utility -*- lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:

;;; Code:

;; https://christiantietze.de/posts/2022/04/emacs-center-window-current-monitor-simplified/
(defun ndb/frame-center (&optional frame)
  "Center FRAME on the screen.
   FRAME can be a frame name, a terminal name, or a frame.
   If FRAME is omitted or nil, use currently selected frame."
  (interactive)
  (unless (eq 'maximised (frame-parameter nil 'fullscreen))
    (modify-frame-parameters
     frame '((user-position . t) (top . 0.5) (left . 0.5)))))

(provide 'frames)
;;; frames.el ends here
