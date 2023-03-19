;;; fonts.el --- Fonts utility -*- lexical-binding: t; no-byte-compile: t -*-
;;; Commentary:

;;; Code:

(defun ndb/font (font-list)
  "Get first FONT installed from FONT-LIST"
   (car (remove nil (mapcar (lambda (font) (car (member font (font-family-list))))
                            font-list))))

(provide 'fonts)
;;; fonts.el ends here
