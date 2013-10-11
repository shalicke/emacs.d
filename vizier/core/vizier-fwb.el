;;; vizier-fwb --- Vizier files, windows, and buffers
;;; Commentary:
;;; Code:

;; auto-byte-compile.
(require 'auto-compile)
(auto-compile-on-load-mode 1)
(auto-compile-on-save-mode 1)

;; TODO: figure out cursor staying in same position when scrolling the window.

;; relative line numbers. Line # in modeline as-is.
(require 'linum-relative)
(linum-relative-toggle)

(require 'tramp)
;; from emacs-live
;;disable backups of files edited with tramp
;;(add-to-list 'bkup-backup-directory-info
;;             (list tramp-file-name-regexp ""))
;;(setq tramp-bkup-backup-directory-info  nil)

(defun sudo-edit (&optional arg)
  "Edit files with tramp/sudo, takes an optional file name ARG."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
;; winner-mode
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; savehist config
(require 'savehist)
(setq savehist-additional-variables
      ;; search entries
      '(search ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the home clean
      savehist-file (concat vizier-tmp-dir "savehist"))
(savehist-mode t)

;; delete-selection-mode. When text is highlighted, simply
;; typing deletes it.
(delete-selection-mode 1)

;; remember places.
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat vizier-tmp-dir "places"))

;; make buffer names unique by path using forward scheme
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward
      uniquify-separator "/"
      uniquify-after-kill-buffer-p t)

;; edit compressed files
(auto-compression-mode t)

;; find-file-at-point, improved
(require 'ffap-)
(ffap-bindings)

;; window-number-mode
;; binds windows to M-1, M-2, etc.
;; TODO: figure out how to rearrange its position in modeline
(require 'window-number)
(window-number-meta-mode 1)

(provide 'vizier-fwb)
;;; vizier-fwb.el ends here
