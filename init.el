;;; init.el --- The entry point to Emacs init
;;; Commentary:
;;; Code:

;; get some melpa toast up in here

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))


;; TODO: don't forget org mode at some point.
;;(package-refresh-contents)

;; user-info
(setq user-mail-address "sam@halicke.com")

;; TODO: M-x customize everything

(defvar base-dir "~/.emacs.d/")
(defvar vendor-dir (concat base-dir "vendor/"))

(add-to-list 'load-path base-dir)
(add-to-list 'load-path vendor-dir)

;; TODO: abstract out vendor libs. Why are these old on melpa?
(add-to-list 'load-path (concat vendor-dir "popup-el/"))
(add-to-list 'load-path (concat vendor-dir "auto-complete/"))
(add-to-list 'load-path (concat vendor-dir "ac-nrepl/"))

;; after modifying load path?
(package-initialize)

;; set the default directory for emacs to our home
;; TODO see if this gets overridden
(setq default-directory "~/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
;; load vizier.
;; setq vizier-install-dir

(load (concat base-dir "vizier/vizier"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#d33682")))))


;; HACK: safe?
(provide 'init)
;;; init.el ends here
