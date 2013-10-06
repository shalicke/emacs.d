;; ido configuration

;; ido-everywhere, etc.
(require 'ido)
(require 'flx-ido)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-use-faces nil)

;; for M-x ffap
(setq ido-use-filename-at-point 'guess)

;; try creating new buffers in ido out.
;; other choice is 'never' or 'prompt'
(setq ido-create-new-buffer 'always)

;; prioritize certain extensions.
(setq ido-file-extensions-order '(".clj" ".el" ".fish" ".js" ".adoc" ".ad" ".md"))

;; ignore certain files and directories.

(setq ido-ignore-extensions t)
