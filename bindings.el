;; key bindings.

(global-set-key (kbd "C-x w") 'save-buffer-delete-frame)
(global-set-key (kbd "C-x C-k") 'save-buffer-kill-buffer)

;; find commands.

(require 'recentf)

(global-set-key (kbd "C-f") nil)
(global-set-key (kbd "C-f f") 'ace-jump-mode)
(global-set-key (kbd "C-f /") 'isearch-forward-regexp)
(global-set-key (kbd "C-f ?") 'isearch-backward-regexp)
(global-set-key (kbd "C-f SPC") 'ido-recentf-open)

;; find files matching current buffer's major mode (see functions.el)
(global-set-key (kbd "C-f g") 'multi-occur-in-this-mode)
