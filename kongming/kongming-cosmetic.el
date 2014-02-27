;;; kongming-cosmetic.el
;;; Commentary:
;; cosmetic stuff -- fonts, theemes, colors, fringe, etc.
;;; Code:

(when (window-system)
  (require 'git-gutter-fringe+))

(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines +1)

(setq-default left-fringe-width 12)
(setq-default right-fringe-width 0)

;; rainbow mode
(rainbow-mode 1)

;; Line numbers
(global-linum-mode 1)
(setq linum-format "%2d")

;; highlight the current line always
(global-hl-line-mode 1)

;; TODO: change highlight flash color.
;; volatile-higlights
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; tooltips in echo area
(setq tooltip-use-echo-area t)
(tooltip-mode -1)

;; trim whitespace.
;; cribbed from emacs live but changed to reflect vizier namespace.
(defun kongming-cleanup-whitespace ()
  (let ((whitespace-style '(trailing empty)) )
    (whitespace-cleanup)))
(add-hook 'before-save-hook 'kongming-cleanup-whitespace)

;; fontify all the things
(setq font-lock-maximum-decoration t)

;; Line-wrapping at 78, not 72
(auto-fill-mode 1)
(set-default 'fill-column 78)

;; get rid of clutter
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; but enable the menubar.
(if (fboundp 'menu-bar-mode) (menu-bar-mode +1))

;; TODO: change this up color-wise. git-gutter has to work here as well. HARMONIZE!
(if (fboundp 'fringe-mode) (fringe-mode 8))

;; powerline
(require 'powerline)
(powerline-default-theme)

;; 24+ themes
(load-theme 'solarized-dark)

;; font setting from emacs-live

(require 'cl)

(defun live-set-default-font (font-string)
  "Set the default font, and set all frames to the same FONT-STRING, trying to maintain window resolution.  Only change font if window system is not a basic terminal."
  (interactive "MNew emacs live default font: ")
  (setq default-frame-alist
        (remove-if (lambda (x)
                     (eq 'font (car x)))
                   default-frame-alist))
  (cond
   ((member (window-system) '(x w32 ns))
    (add-to-list 'default-frame-alist (cons 'font font-string))
    (set-default-font font-string t t))))


;; TODO: Why is this necessary? It works, but, research.
(defun live-set-default-darwin-font (font-string)
  "Set the default font and set all frames to the same FONT-STRING trying to maintain window resolution.  Only change font if `system-type' is darwin in a window system."
  (interactive "MNew darwin default font: ")
  (cond
   ((eq system-type 'darwin)
    (live-set-default-font font-string))))

(live-set-default-darwin-font "PragmataPro-12")

;; no tabs
(set-default 'indent-tabs-mode nil)

(provide 'kongming-cosmetic)
;;; kongming-cosmetic.el ends here