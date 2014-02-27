;;; core.el -- most configuration
;;; Commentary: This is where most of the configuration goes, the bulk of the
;;; 'base' stuff that should be applied to all buffers. As it grows, it'll be
;;; split up, but it's all more or less academic yak-shaving on what goes
;;; where.

;;; For example, I prefer keybinds to be 'by' their required packages for now,
;;; although I will eventually split those out into their own bindings.el file.

;;; Code:

;; initial stuff.

(setq initial-major-mode 'adoc-mode ;; i don't usually want a lisp eval buffer
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
      next-error-highlight-no-select t)

;; utf-8 everywhere.
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; it's me
(setq user-mail-address "sam@halicke.com")

;; better defaults
(require 'better-defaults)

;; smooth scrolling
(require 'smooth-scrolling)

;; yes or no? y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; files, windows, buffers.

;; I almost always want fill mode on.
(auto-fill-mode 1)

;; auto-byte-compile
(require 'auto-compile)
(auto-compile-on-load-mode 1)
(auto-compile-on-save-mode 1)

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
;; savehist config
(setq savehist-additional-variables
      ;; search entries
      '(search ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the home clean
      savehist-file (concat base-dir "savehist"))
(savehist-mode t)

;; delete-selection-mode. When text is highlighted, simply
;; typing deletes it.
(delete-selection-mode 1)

;; company-mode (autocomplete)
;;

(add-hook 'after-init-hook 'global-company-mode)

;; remember places.
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat temporary-file-directory "places"))

;; make buffer names unique by path using forward scheme
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward
      uniquify-separator "/"
      uniquify-after-kill-buffer-p t)

;; edit compressed files
(auto-compression-mode t)

;; undo tree
(require 'undo-tree)
(global-undo-tree-mode 1)
(defalias 'redo 'undo-tree-redo)
;; 【Ctrl+Shift+/]
(global-set-key (kbd "C-S-/") 'redo)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; ace-jump
(require 'ace-jump-mode)

;; shell path
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; OSX specific

(when (eq system-type 'darwin)
  (add-to-list 'completion-ignored-extensions ".DS_Store")
  ;; use spotlight to 'locate'
  (setq locate-command "mdfind")
  (setq mac-function-modifer 'alt)
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)
  (setq mac-right-command-modifier 'hyper)
  (setq mac-right-option-modifier 'delete-char))

;; cursor schmursor
(blink-cursor-mode 0)


;; which-func
(which-function-mode)

;; winpoint - keeps point separate with two diff windows on same file
(require 'winpoint)
(winpoint-mode)

;; twitter
(require 'twittering-mode)
(setq twittering-use-master-password t)

;; helm!
(require 'helm)
(helm-mode)

(require 'helm-descbinds)
(helm-descbinds-mode)

;; guide-key
(require 'guide-key)

(require 'window-number)
(window-number-meta-mode)

;; smartparens
(require 'smartparens-config)
(show-smartparens-global-mode)
(sp-use-smartparens-bindings)

;; pos-tip
(require 'pos-tip)

(require 'kongming-cosmetic)
(require 'kongming-erc)
(require 'kongming-prog)
(require 'kongming-bindings)
(require 'kongming-clojure)

(provide 'kongming-core)
;;; kongming-core.el ends here
