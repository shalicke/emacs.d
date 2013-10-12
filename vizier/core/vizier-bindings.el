;;; vizier-bindings --- Key bindings
;;; Commentary:
;;; Code:

(global-set-key (kbd "C-x w") 'save-buffer-delete-frame)
(global-set-key (kbd "C-x C-k") 'save-buffer-kill-buffer)

;; auto-complete last help
(global-set-key (kbd "C-c C-h") 'ac-last-quick-help)
(global-set-key (kbd "C-c C-S-h") 'ac-last-help)

;; find commands.
(require 'recentf)

(global-set-key (kbd "C-f") nil)
(global-set-key (kbd "C-f i") 'icicle-search)
(global-set-key (kbd "C-f f") 'ace-jump-mode)
(global-set-key (kbd "C-f /") 'isearch-forward-regexp)
(global-set-key (kbd "C-f ?") 'isearch-backward-regexp)

;; TODO: more icicles stuff
;;(global-set-key (kbd "C-f SPC") 'ido-recentf-open)

;; find regexp in files matching current buffer's major mode (see functions.el)
(global-set-key (kbd "C-f g") 'multi-occur-in-this-mode)

(provide 'vizier-bindings)
;;; vizier-bindings.el ends here
