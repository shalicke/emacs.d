;;; kongming-prog --- common programming setup
;;; Commentary:
;; Sets up common minor modes and configuration for all programming via prog-mode-hook.
;;; Code:

;; enable flycheck.
(require 'flycheck)
(require 'flycheck-cask)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook 'flycheck-cask-setup))
(require 'flycheck-tip)

(setq flycheck-tip-avoid-show-func t
      flycheck-display-errors-function
      'flycheck-tip-display-current-line-error-message)

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

;; TODO: enable better SP configuration.
;; TODO: remove the ' pair only for lispy modes
(defun kongming-sp-config-and-enable ()
  "Configure and load smartparens."
  (eval-after-load 'smartparens
    (smartparens-strict-mode 1)
    (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
    (sp-local-pair 'sh-mode "'" nil :actions nil)
    (sp-local-pair 'sh-mode "\"" nil :actions nil)))

;; the full monty.
(defun kongming-prog-mode-hook ()
  "Functions added to the `prog-mode-hook'."
  (kongming-sp-config-and-enable)
  (subword-mode 1)
  (prelude-font-lock-comment-annotations)
  (rainbow-delimiters-mode 1)
  (kongming-auto-fill-comments-only)
  (kongming-flycheck-config-and-enable)
  (company-mode-on)
  (projectile-mode)
  (eldoc-mode)
  (set-return-to-indent))

;; TODO: eventually, put in the smart indirection from prelude
(add-hook 'prog-mode-hook 'kongming-prog-mode-hook)


;; different mode configuration files
(add-to-list 'load-path (concat kongming:base-dir "kongming/modes/"))

;; adoc-mode / bloggy mode
(require 'kongming-adoc)

;; clojure
(require 'kongming-clojure)
(add-hook 'cider-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-cider))
                          (company-mode)))

;; python -- just elpy no separate mode
(elpy-enable)
;;(elpy-use-ipython)
(elpy-clean-modeline)

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "~/.python-virtualenvs/")

(require 'mmm-auto)
(setq mmm-global-mode 'maybe)

;; for mako templating
(add-to-list 'auto-mode-alist '("\\.tmpl\\'" . html-mode))
(mmm-add-mode-ext-class 'html-mode "\\.tmpl\\" 'mako)

;; erlang
;; (require 'kongming-erlang)


;; go
(require 'go-mode-load)
(require 'company-go)

(add-hook 'before-save-hook 'gofmt-before-save)
(setenv "GOPATH" "/Users/shalicke/hacking/go")

;; (add-hook 'go-mode-hook (lambda () (setenv "GOPATH" (make-local-variable 'go-directory "~/hacking/go"))))

(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

;; ocaml
;;(require 'kongming-ocaml)
(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
(add-to-list 'load-path (concat
     (replace-regexp-in-string "\n$" ""
        (shell-command-to-string "opam config var share"))
     "/emacs/site-lisp"))
(require 'ocp-indent)
(require 'ocp-index)
;; org
;;(require 'kongming-org)

(provide 'kongming-prog)
;;; kongming-prog.el ends here
