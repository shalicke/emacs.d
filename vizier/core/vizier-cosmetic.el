;;; vizier-cosmetic --- vizier cosmetic stuff.
;;; Commentary:
;;; Code:

;; Line numbers
;; TODO: linum format, figure this out / refactor
(global-linum-mode 1)
(setq linum-format "%4d")

;; relative line numbers. Line # in modeline as-is.
(require 'linum-relative)
(linum-relative-toggle)

;; highlight the current line always
(global-hl-line-mode 1)

;; volatile-higlights
;; using diff-hl instead of regular HL...
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; tooltips in echo area
(tooltip-mode -1)

;; paren matching, reloaded.
(require 'mic-paren)
(show-paren-mode 0)
(paren-activate)

;; highlight the nearest matching parens
(setq paren-highlight-at-point t)
;; highlight entire not-matching sexp
(setq paren-sexp-mode 'mismatch)
(setq paren-match-face 'hi-green)
(setq paren-mismatch-face 'flycheck-fringe-warning)
(setq paren-no-match-face 'flycheck-fringe-error)

;; trim whitespace.
;; cribbed from emacs live but changed to reflect vizier namespace.
;; FIXME: move to fwb
(defun vizier-cleanup-whitespace ()
  (let ((whitespace-style '(trailing empty)) )
    (whitespace-cleanup)))
(add-hook 'before-save-hook 'vizier-cleanup-whitespace)

;; fontify all the things
(setq font-lock-maximum-decoration t)

;; TODO: consider adding the emacs-live 'hexrgb lite'
;; https://groups.google.com/forum/?fromgroups=#!topic/gnu.emacs.help/EQTSiulnbAo

;; Line-wrapping at 78, not 72
(set-default 'fill-column 78)

;; get rid of clutter
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; FIXME: the menubar seems to cause some wacky shit with notifications on 10.9
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; make fringe smaller-ish
;; TODO: change this up color-wise. git-gutter has to work here as well. HARMONIZE!
(if (fboundp 'fringe-mode) (fringe-mode 6))

;; powerline
(require 'powerline)
(powerline-default-theme)

;; 24+ themes
;; remember, my theme overwrites the base solarized colors
(load-theme 'solarized-dark)

;; font setting from emacs-live
;; TODO: Why is this necessary? It works, but, research.
(defun live-set-default-darwin-font (font-string)
  "Set the default font and set all frames to the same FONT-STRING.
Try to maintain window resolution.  Only change font if `system-type'
is darwin in a window system."
  (interactive "MNew darwin default font: ")
  (cond
   ((eq system-type 'darwin)
    (live-set-default-font font-string))))

(live-set-default-darwin-font "PragmataPro-12")

(provide 'vizier-cosmetic)
;;; vizier-cosmetic.el ends here
