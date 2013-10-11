;; OS X specific configuration
;; ---------------------------

;; thanks to emacs-live for this

;; unsure what effect this actually has.
(setq default-input-method "MacOSX")

;; Make cut and paste work with the OS X clipboard
(defun live-copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun live-paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

;; use pbpaste/pbcopy from the terminal.
(when (not window-system)
  (setq interprogram-cut-function 'live-paste-to-osx)
  (setq interprogram-paste-function 'live-copy-from-osx))

;; still kills yank on unknown pasteboard content... why

;; Work around a bug on OS X where system-name is a fully qualified
;; domain name
(setq system-name (car (split-string system-name "\\.")))

;; Ensure the exec-path honours the shell PATH
(require 'exec-path-from-shell)

;; TODO: ignore .DS with icicles
(add-to-list 'completion-ignored-extensions ".DS_Store")

;; use spotlight to 'locate'
(setq locate-command "mdfind")

;; command (e.g. M) M-` should switch frames
(define-key icicle-mode-map [?\M-`] nil)
(global-set-key [?\M-`] 'other-frame)
