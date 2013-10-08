;; auto-byte-compile
(require 'auto-compile)
(auto-compile-on-load-mode 1)
(auto-compile-on-save-mode 1)

;; savehist config
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
(add-hook 'dired-mode-hook 'ffap-inhibit-here)
