;;; vizier-clojure --- Vizier's Clojure integration
;;; Commentary:
;;; Code:

;; everything in here for now.

;; brilliant, from emacs-live.
;; TODO: add set modifiers for operations like union?
;; don't want to go all APL on it but this is just cool.

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "λ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\)("
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "ƒ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\){"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∈")
                               nil))))))

(eval-after-load 'find-file-in-project
  '(add-to-list 'ffip-patterns "*.clj"))

;; require clojure-mode to affect the keymap
(require 'clojure-mode)

;; TODO: colors for this
(require 'nrepl-eval-sexp-fu)

;; align clojure let statements properly.
;; TODO: bake this into RET
(require 'align-cljlet)

;; show current function in modeline.
(require 'which-func)
(eval-after-load "which-func"
  '(add-to-list 'which-func-modes 'clojure-mode))
(which-function-mode 1)

;; more brilliance from emacs-live.
;; TODO: need to figure out the delete-and-extract-sexp. this done in smartparens already?

(defun live-toggle-clj-keyword-string ()
  "+onvert the string or keyword at (point) from string->keyword or keyword->string."
  (interactive)
  (let* ((original-point (point)))
    (while (and (> (point) 1)
                (not (equal "\"" (buffer-substring-no-properties (point) (+ 1 (point)))))
                (not (equal ":" (buffer-substring-no-properties (point) (+ 1 (point))))))
      (backward-char))
    (cond
     ((equal 1 (point))
      (message "beginning of file reached, this was probably a mistake."))
     ((equal "\"" (buffer-substring-no-properties (point) (+ 1 (point))))
      (insert ":" (substring (live-delete-and-extract-sexp) 1 -1)))
     ((equal ":" (buffer-substring-no-properties (point) (+ 1 (point))))
      (insert "\"" (substring (live-delete-and-extract-sexp) 1) "\"")))
    (goto-char original-point)))

(define-key clojure-mode-map (kbd "C-:") 'live-toggle-clj-keyword-string)

(defun live-cycle-clj-coll ()
  "Convert the coll at (point) from (x) -> {x} -> [x] -> (x) recur."
  (interactive)
  (let* ((original-point (point)))
    (while (and (> (point) 1)
                (not (equal "(" (buffer-substring-no-properties (point) (+ 1 (point)))))
                (not (equal "{" (buffer-substring-no-properties (point) (+ 1 (point)))))
                (not (equal "[" (buffer-substring-no-properties (point) (+ 1 (point))))))
      (backward-char))
    (cond
     ((equal "(" (buffer-substring-no-properties (point) (+ 1 (point))))
      (insert "{" (substring (live-delete-and-extract-sexp) 1 -1) "}"))
     ((equal "{" (buffer-substring-no-properties (point) (+ 1 (point))))
      (insert "[" (substring (live-delete-and-extract-sexp) 1 -1) "]"))
     ((equal "[" (buffer-substring-no-properties (point) (+ 1 (point))))
      (insert "(" (substring (live-delete-and-extract-sexp) 1 -1) ")"))
     ((equal 1 (point))
      (message "beginning of file reached, this was probably a mistake.")))
    (goto-char original-point)))

(define-key clojure-mode-map (kbd "C->") 'live-cycle-clj-coll)

;; include nrepl configuration
(load-vizier-lib "clojure/vizier-nrepl")

(provide 'vizier-clojure)
;;; vizier-clojure.el ends here
