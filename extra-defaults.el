;; extra defaults, one-off settings to turn on minor modes and such

;; common user access for text regions.
(cua-mode 1)

;; Line numbers
(global-linum-mode 1)

;; highlight the current line always
(global-hl-line-mode 1)

;; winner-mode undo/redo
(when (fboundp 'winner-mode)
      (winner-mode 1))

;; savehist config
(setq savehist-additional-variables
      ;; search entries
      '(search ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the home clean
      savehist-file (concat tmp-dir "savehist"))
(savehist-mode t)

;; remember places.
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat tmp-dir "places"))

;; make buffer names unique by path using forward scheme
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward
      uniquify-separator "/"
      uniquify-after-kill-buffer-p t
      uniquify-ignore-buffers-re "^\\*")

;; tooltips in echo area
(setq tooltip-use-echo-area t)
(tooltip-mode -1)

;; recent files
(require 'recentf)
(setq recentf-max-saved-items 50
      recentf-save-file (concat tmp-dir "recentf"))
(recentf-mode t)

;; fic-mode highlights
(require 'fic-mode)
(fic-mode)
(setq fic-background-color nil)
(setq fic-foreground-color "cyan")
