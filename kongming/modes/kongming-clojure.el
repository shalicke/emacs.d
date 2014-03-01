;;; kongming-clojure.el -- clojure config
;;; Commentary:
;; Clojure and CIDER
;;; Code:

(require 'cider)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(add-hook 'cider-repl-mode-hook 'subword-mode)

(add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)

(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(setq nrepl-hide-special-buffers t)

(setq cider-repl-pop-to-buffer-on-connect nil)

(setq cider-popup-stacktraces nil)

(setq cider-repl-result-prefix ";; => ")

(setq cider-repl-use-clojure-font-lock t)

(cider-repl-toggle-pretty-printing)

(provide 'kongming-clojure)
;;; kongming-clojure.el ends here
