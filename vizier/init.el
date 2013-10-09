;; vizier.

(defgroup vizier nil
  "Vizier, an Emacs distribution."
  :version "24.3"
  :group 'convenience)

(defvar vizier-install-dir (concat base-dir "vizier/"))

(defcustom vizier-core-packages '(icicles
                                  auto-complete
                                  better-defaults
                                  smartparens
                                  exec-path-from-shell
                                  ace-jump-mode
                                  yasnippets
                                  undo-tree
                                  recentf
                                  rainbow-delimiters
                                  find-file-in-project
                                  mic-paren
                                  popwin
                                  flycheck)
  "Vizier's core set of packages.")

(defcustom vizier-clojure-packages '(clojure-mode
                                     clojure-test-mode
                                     dash
                                     pkg-info
                                     nrepl
                                     nrepl-tracing
                                     nrepl-sex
                                     ac-nrepl
                                     refheap
                                     align-cljlet)
  "Vizier's Clojure packages."
  :group 'vizier)

(defcustom vizier-adoc-packages '(markup-faces
                                  adoc-mode)
  "Vizier's AsciiDoc packages."
  :group 'vizier)

(defvar vizier-default-package-groups '(vizier-core-packages))

(defcustom vizier-packages vizier-default-package-groups
  "The installed / enabled packages."
  :group 'vizier)

(defun vizier-message (msg-string)
  (message "%s| %s" "Vizier" msg-string))

(defalias 'msg 'vizier-message)

(defun ensure-package-installed (package)
  (unless (package-installed-p package)
    (msg (concat "Installed package: " package))
    (package-install package)))

(defun install-package-list (package-list)
  (mapc
   (lambda (pkg) (ensure-package-installed pkg))
   package-list))

(defun load-vizier-lib (lib)
  (load (concat vizier-install-dir lib)))

(load-vizier-lib "core/init")
(load-vizier-lib "prog/init")
(load-vizier-lib "clojure/init")

;; testing
