;;; vizier-sp-config --- smartparens config / bindings
;;; Commentary:
;;; Code:

;; smartparens config and bindings

;; FIXME: sp-config-and-enable should prbably live here
;; smartparens
(require 'smartparens-config)
(sp-use-paredit-bindings) ; for now

;; moved enabling the mode to the actual hooks

(provide 'vizier-sp-config)
