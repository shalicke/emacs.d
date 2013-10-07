;; mostly cosmetics from here...
;; trim whitespace.
(defun live-cleanup-whitespace ()
  (let ((whitespace-style '(trailing empty)) )
    (whitespace-cleanup)))
(add-hook 'before-save-hook 'live-cleanup-whitespace)

;; fontify all the things
(setq font-lock-maximum-decoration t)

;; Line-wrapping at 78, not 72
(set-default 'fill-column 78)

;; get rid of clutter
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; but enable the menubar.
(menu-bar-mode t)

;; make fringe smaller
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

;; 24+ themes
(load-theme 'solarized-dark)
