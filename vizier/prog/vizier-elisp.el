;;; vizier-elisp --- Emacs Lisp
;;; Commentary:
;;; Code:

;; went through the hoops of adding the functions, etc sources to the elisp hook
;; only to discover that ac sets that up by default automatically.

(defun vizier-elisp-mode-hook
  nil)

(add-hook 'emacs-lisp-mode-hook 'vizier-elisp-mode-hook)

(provide 'vizier-elisp)
;;; vizier-elisp.el ends here
