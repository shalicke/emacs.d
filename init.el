;; get some melpa toast up in here

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/"))

(package-initialize)
;; (package-refresh-contents)

;; user-info
(setq user-mail-address "sam@halicke.com")

(setq base-dir "~/.emacs.d/")
(setq vendor-dir (concat base-dir "vendor/"))

(add-to-list 'load-path base-dir)
(add-to-list 'load-path vendor-dir)

;; set the default directory for emacs to our home
;; TODO see if this gets overridden
(setq default-directory "~/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
;; load vizier.
;; setq vizier-install-dir

(load (concat base-dir "vizier/init"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#d33682")))))
