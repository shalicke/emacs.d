;;; vizier-prog --- common programming setup for Vizier.
;;; Commentary:
;;; Code:

(add-to-list 'load-path (concat base-dir "vizier/prog/"))

;; enable flycheck.
(require 'flycheck)
(require 'smartparens-config)

;; smart things from prelude
(defun prelude-local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t))

(defun prelude-font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.

  This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):\\)"
          1 font-lock-warning-face t))))

;; flycheck configuration.
(setq flycheck-indication-mode 'right-fringe)
(setq flycheck-highlighting-mode 'sexps)


;; apparently doesn't inherit from prog-mode?
;; FIXME: figure this out
(defun set-return-to-indent ()
  "Bind the return key to `reindent-then-newline-and-indent'."
  (progn (define-key prog-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
         (define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)))

(defun vizier-prog-mode-hook ()
  "Functions added to the prog-mode-hook by Vizier."
  (smartparens-strict-mode 1)
  (sp-pair "'" nil :actions :rem) ; so fucking annoying
  (flycheck-mode 1)
  (subword-mode 1)
  (prelude-local-comment-auto-fill)
  (prelude-font-lock-comment-annotations)
  (rainbow-delimiters-mode 1)
  (set-return-to-indent))

;; eventually, put in the smart indirection from prelude
(add-hook 'prog-mode-hook 'vizier-prog-mode-hook)

(provide 'vizier-prog)
;;; init.el ends here
