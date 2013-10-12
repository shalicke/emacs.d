;;; vizier-powerline --- powerline custom prompt stuff.
;;; Commentary:
;;; Code:

(defun vizier-transform-minor-modes (mode-list)
  "Transform the minor mode list MODE-LIST into 'prettified' characters."
  (mapcar
   (lambda (mode)
     (cond
      ((equalp mode "Emacs-Lisp") (format-mode-line "ELISP"))
      ((equalp mode "Lisp Interaction") (format-mode-line "LISPI"))))
   mode-list))

(vizier-transform-minor-modes '("Emacs-Lisp" "Lisp Interaction" "Bsdf"))

(provide 'vizier-powerline)
;;; vizier-powerline.el ends here
