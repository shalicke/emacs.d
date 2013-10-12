;;; vizier-core --- the core Vizier configuration.

;;; Commentary:
;; Load the default modules.

;; some packages just need to be enabled or have a little bit of configuration,
;; and don't really need their own configuration file.

;;; Code:

;; better-defaults
(require 'better-defaults)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode 1)

(defalias 'redo 'undo-tree-redo)
;; stray binding
(global-set-key (kbd "C-S-z") 'redo)

;; yasnippets
(require 'yasnippet)
(yas-global-mode 1)

;; ace-jump
(require 'ace-jump-mode)

;; load vizier defaults and file structure, create directories if necessary, etc.
(load-vizier-lib "core/vizier-defaults")

;; files, buffers, and window configuration.
(load-vizier-lib "core/vizier-fwb")

;; TODO: move these to the package interface.
;; misc functions that need a home or to be better grouped.
;; also, cask.

(load-vizier-lib "core/vizier-functions")

;; icicles
(load-vizier-lib "core/vizier-icicles")

;; popwin
(load-vizier-lib "core/vizier-pw-config")

;; terminal
(load-vizier-lib "core/vizier-term-config")

;; auto-complete
(load-vizier-lib "core/vizier-autocomplete")

;; smartparens
(load-vizier-lib "core/vizier-sp-config")

;; (sparse) global bindings
(load-vizier-lib "core/vizier-bindings")

;; load OSX if we're on OSX.
(when (eq system-type 'darwin)
  (load-vizier-lib "core/vizier-osx"))

;; powerline (vendor lib)
(add-to-list 'load-path (concat vendor-dir "emacs-powerline/"))
(require 'powerline)

;; cosmetic
(load-vizier-lib "core/vizier-cosmetic")

(provide 'vizier-core)
;;; vizier-core.el ends here
