;;; kongming-cosmetic.el --- cosmetic stuff
;;; Commentary:
;; cosmetic stuff -- fonts, theemes, colors, fringe, etc.
;;; Code:



;; rainbow mode
(rainbow-mode 1)

;; Line numbers
(require 'linum)
(global-linum-mode 1)
(setq linum-format "%2d")

;; highlight the current line always
(global-hl-line-mode 1)

;; TODO: change highlight flash color.
;; volatile-higlights
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; tooltips in echo area
(tooltip-mode)

;; pop window from bottom with popwin.
(require 'popwin)
(popwin-mode 1)
(setq display-buffer-function 'popwin:display-buffer)

(setq popwin:special-display-config
      '(("*Help*"  :height 30)
        ("*Completions*" :noselect t)
        ("*Messages*" :noselect t :height 30)
        ("*compilation*" :noselect t)
        ("*Backtrace*" :height 30)
        ("*Messages*" :height 30)
        ("*Occur*" :noselect t)
        ("*Ido Completions*" :noselect t :height 30)
        ("*magit-commit*" :noselect t :height 40 :width 80 :stick t)
        ("*magit-diff*" :noselect t :height 40 :width 80)
        ("*magit-edit-log*" :noselect t :height 15 :width 80)
        ("\\*magit\\.*" :regexp t :height 30 :width 80 :noselect)
        ("\\*ansi-term\\*.*" :regexp t :height 30)
        ("*shell*" :height 30)
        ("*gists*" :height 30)
        ("*sldb.*":regexp t :height 30)
        ("*cider-error*" :height 30 :stick t)
        ("*cider-doc*" :height 30 :stick t)
        ("*cider-src*" :height 30 :stick t)
        ("*cider-result*" :height 30 :stick t)
        ("*cider-macroexpansion*" :height 30 :stick t)
        ("*Compile-Log*" :height 30 :stick t)
        ("*Deft*" :height 30 :stick t)
        ("*git-gutter+-diff*" :height 15 :stick t)))

;; trim whitespace.
;; cribbed from emacs live
(defun kongming-cleanup-whitespace ()
  "Cleanup whitespace on save."
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

;; fringe stuff

(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines +1)

(setq-default left-fringe-width 12)
(setq-default right-fringe-width 0)

(if (fboundp 'fringe-mode) (fringe-mode 12))

;; highlight differences
(diff-hl-mode 1)

;; powerline
(require 'powerline)
(powerline-center-theme)

;; 24+ themes

(setq solarized-high-contrast-mode-line t)
(load-theme 'solarized-dark)

;; font setting from emacs-live

;; for remove-if
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
    (set-frame-font font-string t t))))


;; TODO: Why is this necessary? It works, but, research.
(defun live-set-default-darwin-font (font-string)
  "Set the default font and set all frames to the same FONT-STRING trying to maintain window resolution.  Only change font if `system-type' is darwin in a window system."
  (interactive "MNew darwin default font: ")
  (cond
   ((eq system-type 'darwin)
    (live-set-default-font font-string))))

(live-set-default-darwin-font "PragmataPro-14")

;; (set-frame-font "PragmataPro-14")
;; no tabs
(set-default 'indent-tabs-mode nil)

(require 'diminish)
(eval-after-load "filladapt" '(diminish 'filladapt-mode))

(provide 'kongming-cosmetic)
;;; kongming-cosmetic.el ends here
