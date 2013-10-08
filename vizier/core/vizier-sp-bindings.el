;; smartparens config and bindings

;; smartparens
(require 'smartparens-config)
(sp-use-paredit-bindings) ; for now

;; remove the single quote pair in lisp/clj
(sp-local-pair '(emacs-lisp-mode clojure-mode nrepl-mode) "'" nil :actions :rem)

;; smartparens in prog mode.
(add-hook 'prog-mode-hook 'smartparens-mode)
