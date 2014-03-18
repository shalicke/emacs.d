;;; kongming-bindings.el -- bindings
;;; Commentary:
;; Global keybinds.
;;; Code:

;; flycheck test
(global-set-key (kbd "C-c C-e") 'flycheck-tip-cycle)

;; remap movement

(global-set-key (kbd "M-j") 'next-line)
(global-set-key (kbd "M-k") 'previous-line)
(global-set-key (kbd "M-h") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)

;; key chords
(require 'key-chord)
(key-chord-mode 1)

;; (key-chord-define-global "/?" 'isearch-forward-regexp)
(key-chord-define-global "??" 'isearch-forward-regexp)


;; windows

(global-set-key (kbd "M-2") 'delete-window)
(global-set-key (kbd "M-3") 'delete-other-windows)
(global-set-key (kbd "M-4") 'split-window-vertically)
(global-set-key (kbd "M-s") 'other-window)

;; TODO: rewrite these functions
;;(global-set-key (kbd "C-x w") 'save-buffer-delete-frame)
;;(global-set-key (kbd "C-x C-k") 'save-buffer-kill-buffer)


(global-set-key (kbd "C-M--") 'text-scale-decrease)
(global-set-key (kbd "C-M-+") 'text-scale-increas)

(global-set-key (kbd "C-f f") 'ace-jump-mode)
(global-set-key (kbd "C-f /") 'isearch-forward-regexp)
(global-set-key (kbd "C-f ?") 'isearch-backward-regexp)

;; find regexp in files matching current buffer's major mode (see
;; functions.el)
;; TODO: fix this
(global-set-key (kbd "C-f g") 'multi-occur-in-this-mode)

(defvar kongming:magit-keymap nil)
(define-prefix-command 'kongming:magit-keymap)
(global-set-key (kbd "C-x C-g") 'kongming:magit-keymap)

(define-key kongming:magit-keymap (kbd "s") 'magit-status)
(define-key kongming:magit-keymap (kbd "c") 'magit-commit)
(define-key kongming:magit-keymap (kbd "l") 'magit-log)

;; Helm.

(global-set-key (kbd "C-c h h") 'helm-mini)
(global-set-key (kbd "C-c h <SPC>") 'helm-all-mark-ring)

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
