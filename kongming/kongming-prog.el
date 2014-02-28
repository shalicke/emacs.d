;;; kongming-prog --- common programming setup
;;; Commentary:
;; Sets up common minor modes and configuration for all programming via prog-mode-hook.
;;; Code:

;; enable flycheck.
(require 'flycheck)
(require 'flycheck-tip)



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
(defun kongming-flycheck-config-and-enable ()
  "Configure and enable flycheck-mode."
  (setq flycheck-indication-mode 'left-fringe)
  (setq flycheck-highlighting-mode 'sexps)
  (setq flycheck-idle-change-delay 30)
  (setq flycheck-completion-system 'ido)
  (global-flycheck-mode 1))

;; Apparently doesn't inherit from prog-mode?
;; FIXME: figure this out
(defun set-return-to-indent ()
  "Bind the return key to `reindent-then-newline-and-indent'."
  (progn (define-key prog-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
         (define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)))

;; set for filling comments only, and enables auto-fill mode.
(defun kongming-auto-fill-comments-only ()
  "Set fill mode on for code comments only."
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode 1))

(defun kongming-sp-config-and-enable ()
  "Configure and load smartparens."
  (eval-after-load 'smartparens
    '(progn (sp-pair "'" nil :actions :rem)
            (smartparens-strict-mode 1))))

;; the full monty.
(defun kongming-prog-mode-hook ()
  "Functions added to the prog-mode-hook by Vizier."
  ;; TODO: enable better SP configuration.
  (kongming-sp-config-and-enable)
  (subword-mode 1)
  (prelude-font-lock-comment-annotations)
  (rainbow-delimiters-mode 1)
  (kongming-auto-fill-comments-only)
  (kongming-flycheck-config-and-enable)
  (set-return-to-indent))

;; TODO: eventually, put in the smart indirection from prelude
(add-hook 'prog-mode-hook 'kongming-prog-mode-hook)

;; always enable projectile
;;(add-hook 'prog-mode-hook 'projectile-on)

;; different mode configuration files
(add-to-list 'load-path (concat base-dir "kongming/modes/"))

;; adoc-mode / bloggy mode
(require 'kongming-adoc)

;; clojure
(require 'kongming-clojure)

;; erlang
;(require 'kongming-erlang)

;; ocaml
;;(require 'kongming-ocaml)

;; org
;;(require 'kongming-org)

(provide 'kongming-prog)
;;; kongming-prog.el ends here
