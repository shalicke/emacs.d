;;; vizier-nrepl --- nrepl configuration.
;;; Commentary:
;;; Code:

(require 'nrepl)
(require 'auto-complete)

;; eldoc in nrepl
(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)

;; no -connection or -server buffer
(setq nrepl-hide-special-buffers t)

;; don't pop sts
(setq nrepl-popup-stacktraces nil)

;; do not pop up the repl buffer
(setq nrepl-pop-to-repl-buffer-on-connect nil)

(add-hook 'nrepl-repl-mode-hook 'smartparens-strict-mode)
(add-hook 'nrepl-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'nrepl-repl-mode-hook 'subword-mode)

;; C-c C-z jumps to the nrepl buffer.
(add-to-list 'same-window-buffer-names "*nrepl*")

(setq nrepl-auto-select-error-buffer t)

;; don't pop up the buffer after connecting
(setq nrepl-pop-to-repl-buffer-on-connect nil)
(setq nrepl-buffer-name-separator "-")

;; TODO: gather up bindings perhaps
(define-key clojure-mode-map (kbd "C-<ret>") 'nrepl-eval-expression-at-point)

;; ac-nrepl
(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; use ac-nrepl doc
(define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

(provide 'vizier-nrepl)
;;; vizier-nrepl.el ends here
