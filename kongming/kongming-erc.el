;;; kongming-erc.el -- ERC settings
;;; Commentary:
;; Stuff related to ERC
;;; Code:

(require 'erc)
(require 'erc-stamp)

;; we really don't need autocomplete, yo
(add-hook 'erc-mode-hook (lambda () (company-mode 0)))

;; keep input line at bottom
(setq erc-input-line-position -1)

;; ignore join/part/quit
(setq erc-hide-list '("JOIN" "PART" "QUIT"))

;; timestamp + wrap
(setq erc-timestamp-format "[%H:%M]")

;; modeline -- I'm always on freenode, no server needed
(setq erc-mode-line-format "%t %a %l")

(provide 'kongming-erc)
;;; kongming-erc.el ends here
