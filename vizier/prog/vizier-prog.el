;;; vizier-prog --- common programming setup for Vizier.
;;; Commentary:
;; Sets up common minor modes and configuration for all programming via prog-mode-hook.
;;; Code:

(add-to-list 'load-path (concat base-dir "vizier/prog/"))

;; enable flycheck.
(require 'flycheck)
(require 'smartparens-config)

;; smart things from prelude
;; added NOTE.
;; TODO: redo the groupings of these.
(defun prelude-font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations.

  This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(\\(FIX\\(ME\\)?\\|TODO\\|NOTE\\|OPTIMIZE\\|HACK\\|REFACTOR\\):\\)"
          1 font-lock-warning-face t))))

;; flycheck configuration.
(defun vizier-flycheck-config-and-enable ()
  "Configure and enable flycheck-mode."
  (setq flycheck-indication-mode 'right-fringe)
  (setq flycheck-highlighting-mode 'sexps)
  (setq flycheck-completion-system 'grizzl)
  (flycheck-mode 1))

;; apparently doesn't inherit from prog-mode?
;; FIXME: figure this out
(defun set-return-to-indent ()
  "Bind the return key to `reindent-then-newline-and-indent'."
  (progn (define-key prog-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
         (define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)))

;; set for filling comments only, and enables auto-fill mode.
(defun vizier-auto-fill-comments-only ()
  "Set fill mode on for code comments only."
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode 1))

(defun vizier-sp-config-and-enable ()
  "Configure and load smartparens."
  (eval-after-load 'smartparens
    '(progn (sp-pair "'" nil :actions :rem)
            (smartparens-strict-mode 1))))

;; the full monty.
(defun vizier-prog-mode-hook ()
  "Functions added to the prog-mode-hook by Vizier."
  ;; TODO: enable better SP configuration.
  (vizier-sp-config-and-enable)
  (subword-mode 1)
  (prelude-font-lock-comment-annotations)
  (rainbow-delimiters-mode 1)
  (vizier-auto-fill-comments-only)
  (vizier-flycheck-config-and-enable)
  (set-return-to-indent))

;; TODO: eventually, put in the smart indirection from prelude
(add-hook 'prog-mode-hook 'vizier-prog-mode-hook)

(provide 'vizier-prog)
;;; vizier-prog.el ends here
