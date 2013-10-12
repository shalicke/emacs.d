;;; vizier -- an emacs thing
;;; Commentary:
;; aims to be useful, partially succeeds

;; notes

;; use grizzl's completing-read for helm. Can Helm do JavaDoc?

;; clojure documentation available via emacs, but better than
;; clojuredocs. It's just gotta be better than that. Blargh.

;; Stack Overflow search from Emacs, and Google. (Prelude has these I think.)

;; TODO still.

;; TODOs in source
;; project integration stuff -- vizier lein plugin? .vizier files for
;; configuraiton of buffers, etc. or maybe a :vizier key in profiles.clj.

;; icy-mode completion of the 'right' things.
;; icy/grizzl/helm/fuzzy/all-that.

;; mic-paren and smartparens configuration bits from emacs-live

;; color-coordination of things

;; add to solarized theme

;; vizier-tasks -- parse special code tags like TODO into another file with
;; references to originals, etc. Running list of grouped HACK/FIXME/RESEARCH
;; etc.

;; implement as minor code-tags-to-tasks mode or something

;;; Code:

;; vizier.

(defgroup vizier nil
  "Vizier, an Emacs distribution."
  :version "24.3"
  :group 'convenience)

(defvar vizier-install-dir (concat base-dir "vizier/"))

;; TODO: move this all to Cask.

;; package management moved to cask / deleted.

(defun vizier-message (msg-string)
  (message "%s| %s" "Vizier" (message msg-string)))

(defalias 'msg 'vizier-message)

(defun ensure-package-installed (package)
  (unless (package-installed-p package)
    (msg (concat "Installed package: " package))
    (package-install package)))

(defun load-vizier-lib (lib)
  (load (concat vizier-install-dir lib)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/solarized-emacs/")
(add-to-list 'load-path "~/.emacs.d/vendor/solarized-emacs/")

(defun vizier-load-core ()
  "Load Vizier's core."
  (load-vizier-lib "core/vizier-core"))

(defun vizier-load-prog ()
  "Load Vizier's programming mode functionality."
  (interactive)
  (load-vizier-lib "prog/vizier-prog"))

(defun vizier-load-org ()
  "Load Vizier's org-mode functionality.")

(defun vizier-load-adoc ()
  "Load Vizier's AsciiDoc functionality.")

(defun vizier-load-git ()
  "Load Vizier's git functionality.")

(defun vizier-load-elisp ()
  "Load Vizier's Emacs Lisp functionality."
  (interactive)
  (load-vizier-lib "prog/vizier-elisp"))

(defun vizier-load-project ()
  (interactive)
  "Load Vizier's project(ile) functionality.")

(defun vizier-load-clojure ()
  "Load Vizier's Clojure and nREPL functionality."
  (interactive)
  (load-vizier-lib "clojure/vizier-clojure")
  (load-vizier-lib "clojure/vizier-clojure-test")
  (load-vizier-lib "clojure/vizier-nrepl"))

;; will have to modify how other things run, i think.
;; TODO: investigate hook order / running / etc

(vizier-load-core)
(vizier-load-prog)
(vizier-load-elisp)
(vizier-load-clojure)

;; testing
(provide 'vizier)
;;; vizier.el ends here
