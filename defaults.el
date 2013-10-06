;; defaults / basic stuff.

(load "vars")

;; create required directories for things.
;; tmp
;; autosave
;; snippets
;; lib

;; the auto-save and backup directories.
(setq backup-directory-alist
      `((".*" . ,autosave-dir)))

(setq auto-save-file-name-transforms
      `((".*" ,autosave-dir t)))

;; replace yes/no with y/n.
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)

;; make buffer names unique by path using forward scheme
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; snippets everywhere.
(require 'yasnippet)
(yas-global-mode 1)

;; auto-complete everything.
(load "ac-config")

;; tooltips in echo area
(tooltip-mode -1)
(setq tooltip-use-echo-area t)

;; load ido customizations
(load "ido")

;; recent files
(require 'recentf)
(recentf-mode t)
(setq recentf-max-saved-items 50)

;; Disable the bell.
(setq ring-bell-function 'ignore)

;; get rid of the toolbar.
(tool-bar-mode -1)

;; and the splash screen
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; but enable the menubar.
(menu-bar-mode t)

;; because reasons.
;; i have caps lock bound to control everywhere.
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; utf-8 everywhere, disable CJK.
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq utf-translate-cjk-mode nil)

;; don't use tabs, spaces only.
(set-default 'indent-tabs-mode nil)

;; edit compressed files
(auto-compression-mode t)

;; show matching parens, no delay.
(show-paren-mode 1)
(setq show-paren-delay 0)

;; emacs uses the clipboard
(setq x-select-enable-clipboard t)

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
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; make fringe smaller
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

;; 24+ themes
(load-theme 'solarized-dark)

;; rainbows!
