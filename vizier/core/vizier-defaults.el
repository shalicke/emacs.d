;;; vizier-defaults --- defaults / basic stuff, and built-in functionality.
;;; Commentary:
;; again, lots of things cribbed from emacs-live or slightly modified.
;;; Code:

(defvar vizier-base-dir "~/.emacs.d/")
(defvar vizier-tmp-dir (concat vizier-base-dir "tmp/"))
(defvar vizier-lib-dir (concat vizier-base-dir "lib/"))
(defvar vizier-snippets-dir (concat vizier-base-dir "snippets/"))
(defvar vizier-autosave-dir (concat vizier-tmp-dir "autosave/"))

;; create required directories for things.
;; tmp
;; autosave
;; snippets
;; lib

;; don't use tabs, spaces only.
(set-default 'indent-tabs-mode nil)

;; the auto-save and backup directories.
(setq backup-directory-alist
      `((".*" . ,vizier-autosave-dir)))

(setq auto-save-file-name-transforms
      `((".*" ,vizier-autosave-dir t)))

;; replace yes/no with y/n.
(fset 'yes-or-no-p 'y-or-n-p)

;; default startup and setting of variables.
(setq initial-major-mode 'lisp-interaction-mode
      ;; utf-8 (see other coding vars set elsewhere)
      locale-coding-system 'utf-8
      ;; pending input does not pre-empt redraw
      redisplay-dont-pause t
      ;; disable the bell.
      ring-bell-function 'ignore
      ;; display column in modeline.
      column-number-mode t
      ;; echo control keystrokes
      echo-keystrokes 0.02
      ;; no startup message / splash.
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      ;; transient mark mode, i.e. 'modern' mark
      transient-mark-mode t
      ;; enable shift-select.
      ;; this is disabled in emacs-live.
      shift-select-mode t
      ;; add a single newline at the end of a doc.
      require-final-newline t
      ;; turns wrapping on in horizontally split windows.
      truncate-partial-width-windows nil
      ;; actually unlink, don't move to Trash, etc.
      delete-by-moving-to-trash nil
      ;; don't ask me if i want to create a buffer.
      confirm-nonexistent-file-or-buffer nil
      ;; highlight matching parens immediately
      show-paren-delay 0
      ;; use the X clipboard -- problematic!
      ;; x-select-enable-clipboard t
      ;; highlight search/replace
      query-replace-highlight t
      ;; compilation mode stuff
      ;; TODO: move to prog mode.
      compilation-auto-jump-to-first-error t
      next-error-highlight t
      next-error-highlight-no-select t
      ;; command is M, option is s
      mac-command-modifier 'meta
      mac-option-modifier 'super)

;; utf-8 everywhere.
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(provide 'vizier-defaults)
;;; vizier-defaults.el ends here
