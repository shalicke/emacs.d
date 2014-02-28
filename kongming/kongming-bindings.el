;;; kongming-bindings.el -- bindings
;;; Commentary:
;; Global keybinds.
;;; Code:


;; key chords
(require 'key-chord)
(key-chord-mode 1)

(key-chord-define-global "//" 'isearch-forward-regexp)
(key-chord-define-global "??" 'isearch-backward-regexp)

;; windows

(global-set-key (kbd "M-2") 'delete-window)
(global-set-key (kbd "M-3") 'delete-other-windows)
(global-set-key (kbd "M-4") 'split-window-vertically)
(global-set-key (kbd "M-s") 'other-window)


;; TODO: rewrite these functions
;;(global-set-key (kbd "C-x w") 'save-buffer-delete-frame)
;;(global-set-key (kbd "C-x C-k") 'save-buffer-kill-buffer)

(global-set-key (kbd "C-f") nil)
(global-set-key (kbd "C-f C-f") 'ace-jump-mode)
(global-set-key (kbd "C-f /") 'isearch-forward-regexp)
(global-set-key (kbd "C-f ?") 'isearch-backward-regexp)

;; find regexp in files matching current buffer's major mode (see functions.el)
(global-set-key (kbd "C-f g") 'multi-occur-in-this-mode)

;; Helm.
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-c f") 'helm-for-files)

;; Org.
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c b") 'org-iswitchb)


(provide 'kongming-bindings)
;;; kongming-bindings.el ends here
