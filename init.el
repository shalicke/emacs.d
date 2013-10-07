;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; get some melpa toast up in here

(require 'package)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/"))

(package-initialize)
;;(package-refresh-contents)

(require 'auto-compile)
(auto-compile-on-load-mode 1)
(auto-compile-on-save-mode 1)

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/lib")

;; set the default directory for emacs to our home
;; TODO see if this gets overridden
(setq default-directory "~/")

(defvar local-package-list '(clojure-mode
                              better-defaults
                              recentf
                              flx
                              flx-ido
                              hexrgb
                              popup
			      clojure-test-mode
			      yasnippets
			      clojure-snippets
			      nrepl
			      ac-nrepl
			      smartparens
			      ace-jump-mode
			      magit
			      git-gutter
                              crosshairs))

;; lots of stuff from emacs live, mixed with my own.
;; defaults / basic settings like encoding, bell, etc.
(load "defaults")

;; functions.
(load "functions")

;; ido-mode and flx-ido
(load "ido-config")

;; auto-complete
(load "ac-config")

;; snippets
(load "snippet-config")

;; nrepl and ac-nrepl
(load "nrepl-config")

;; projectile
(load "projectile-config")

;; OS X
(load "osx")

;; Popwin
(load "pw-config")

;; smartparens config and bindings.
(load "sp-bindings")

;; key bindings
(load "bindings")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)

;; font loading/setting.
(load "fonts")

;; cosmetics
(load "cosmetic")
