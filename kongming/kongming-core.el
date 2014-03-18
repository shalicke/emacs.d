;;; kongming-core.el -- core configuration
;;
;;; Commentary:
;;
;;; This is where most of the configuration goes, the bulk of the
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
;; savehist config
(require 'savehist)
(setq savehist-additional-variables
      ;; search entries
      '(search ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the home clean
      savehist-file (concat kongming:base-dir "savehist"))
(savehist-mode t)

;; delete-selection-mode. When text is highlighted, simply
;; typing deletes it.
(delete-selection-mode 1)

;; company-mode (autocomplete)
;;

(require 'company)

(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-minimum-prefix-length 0)               ; autocomplete right after '.'
(setq company-idle-delay .3)                         ; shorter delay before autocompletion popup
(setq company-echo-delay 0)                          ; removes annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

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
(require 'helm-config)
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

;; browse kill ring
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;; abbrev-mode
(setq abbrev-mode t)

;; pos-tip
;; TODO: configure this
(require 'pos-tip)

(require 'deft)
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-directory "~/Dropbox/notes")
(global-set-key [(super s)] 'deft)

(require 'recentf)
(recentf-mode)
(setq recentf-max-menu-items 25)


(require 'tramp)
;; tramp
(setq tramp-default-user "shalicke"
      tramp-default-host "ops.neuros.es")

(add-to-list 'tramp-default-proxies-alist
             '("\\.neuros\\.es\\'" "\\`root\\'" "/ssh:%h:"))

;; cosmetic stuff, fonts, colors, etc
(require 'kongming-cosmetic)

;; erc configuration
(require 'kongming-erc)

;; org-mode
(require 'kongming-org)

;; prog includes all other programming modes
(require 'kongming-prog)

;; bindings last to override other stuff
(require 'kongming-bindings)

(provide 'kongming-core)
;;; kongming-core.el ends here
