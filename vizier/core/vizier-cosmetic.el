;; vizier cosmetic stuff.

;; Line numbers
(global-linum-mode 1)
(linum-format "%2d")

;; highlight the current line always
(global-hl-line-mode 1)

;; tooltips in echo area
(setq tooltip-use-echo-area t)
(tooltip-mode -1)

;; paren matching, reloaded.
(require 'mic-paren)
(paren-activate)

;; trim whitespace.
;; cribbed from emacs live but changed to reflect vizier namespace.
(defun vizier-cleanup-whitespace ()
  (let ((whitespace-style '(trailing empty)) )
    (whitespace-cleanup)))
(add-hook 'before-save-hook 'vizier-cleanup-whitespace)

;; fontify all the things
(setq font-lock-maximum-decoration t)

;; Line-wrapping at 78, not 72
(set-default 'fill-column 78)

;; get rid of clutter
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; but enable the menubar.
(if (fboundp 'menu-bar-mode) (menu-bar-mode +1))
;; make fringe smaller
(if (fboundp 'fringe-mode) (fringe-mode 4))

;; 24+ themes
(load-theme 'solarized-dark)

;; font setting from emacs-live
;; fonts.
(require 'cl)

(defun live-set-default-font (font-string)
  "Sets the default font and sets all frames to the same font trying to maintain window resolution. Only changes font if window system is not a basic terminal."
  (interactive "MNew emacs live default font: ")
  (setq default-frame-alist
        (remove-if (lambda (x)
                     (eq 'font (car x)))
                   default-frame-alist))
  (cond
   ((member (window-system) '(x w32 ns))
    (add-to-list 'default-frame-alist (cons 'font font-string))
    (set-default-font font-string t t))))

(defun live-set-default-darwin-font (font-string)
  "Sets the default font and sets all frames to the same font trying to maintain window resolution. Only changes font if system-type is darwin in a window system."
  (interactive "MNew darwin default font: ")
  (cond
   ((eq system-type 'darwin)
    (live-set-default-font font-string))))

(live-set-default-darwin-font "PragmataPro-12")
