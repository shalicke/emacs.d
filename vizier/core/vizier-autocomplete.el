;;; vizier-autocomplete --- Autocomplete settings.
;;; Commentary:
;; auto-complete settings.

;; heavily cribbed from the fantastic emacs-live.

;; there have got to be some improvements here though.

;; TODO: colors / highlighting of potential matches (?)
;; TODO: tweak ac settings

;;; Code:

(require 'fuzzy)
(require 'popup)
(require 'auto-complete)
(require 'auto-complete-config)

;; improved tooltips... ?
;; (require 'pos-tip)
;; default is gross.
(setq ac-comphist-file (concat vizier-tmp-dir "ac-comphist.dat"))

;; load the default setup.
(ac-config-default)

;; show menu automatically, no delay
(setq ac-auto-show-menu t)

;; TAB/RET magic
(setq ac-dwim t)

;; don't use ac-completing-map, use ac-menu-map.
(setq ac-use-menu-map t)

;; ac-height to 20.
(setq ac-menu-height 20)

;; ignore case if completion target doesn't have uppercase
(setq ac-ignore-case 'smart)

;; use fuzzy matching
;; can this be done better in some other way?
(setq ac-use-fuzzy t)

;; expand on common part
(setq ac-expand-on-auto-complete t)

;; .5 delay before doc tip
(setq ac-quick-help-delay 0.5)
(setq ac-quick-help-height 80)

;; shows completions underlined inline as well. Set to t to change.
(setq ac-disable-inline nil)

;; start at 2 characters for completion
(setq ac-auto-start 2)
(setq ac-candidate-menu-min 0)

;; flyspell? enable workaround for AC performance.
(when (fboundp 'flyspell-mode)
  (ac-flyspell-workaround))

;; add sources in other modes. lots for elisp.
(set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-filename
               ac-source-yasnippet))

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode))
  (add-to-list 'ac-modes mode))

;; faces... do this in theme?
;; ac-completion-face (inline)
;; ac-candidate-face (menu bg)
;; ac-selection-face (menu selection)

;; enable ac in all buffers.
(global-auto-complete-mode t)

;;;;Key triggers
;; TODO: tune these
;; aren't these taken care of by DWIM?

(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)
(define-key ac-menu-map "\t" 'ac-complete)
(define-key ac-menu-map (kbd "M-RET") 'ac-help)
(define-key ac-menu-map "\r" 'nil)

(provide 'vizier-autocomplete)
;;; vizier-autocomplete.el ends here
