;; nrepl configuration.
(require 'nrepl)

;; eldoc in nrepl
(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)

;; no -connection or -server buffer
(setq nrepl-hide-special-buffers t)

;; don't pop sts
(setq nrepl-popup-stacktraces nil)

(add-hook 'nrepl-repl-mode-hook 'smartparens-strict-mode)
(add-hook 'nrepl-repl-mode-hook 'rainbow-delimiters-mode)
(setq nrepl-auto-select-error-buffer t)

;; don't pop up the buffer after connecting
(setq nrepl-pop-to-repl-buffer-on-connect nil)
(setq nrepl-buffer-name-separator "-")

;; ac-nrepl
(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
  (eval-after-load "auto-complete"
    '(add-to-list 'ac-modes 'nrepl-mode))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)
