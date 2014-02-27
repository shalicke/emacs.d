;;; init.el -- the entry point to my emacs.d.
;;; Commentary:
;; This once started out as a project called Vizier. It has been reborn as a
;; smaller, leaner project called Kong Ming. Vizier suffered from the intent
;; to be redistributed or modified much in the same way as emacs-live. I do
;; not intend to create a distribution here, just keep things organized. That
;; said, I do need a proper namespace for things, so everything will be
;; referred to as ```require kongming-core``` and the like. Schwing!
;;; Code:

;; init.el

;; use Cask and Pallet to manage packages.

(require 'cask "~/.cask/cask.el")
(cask-initialize)
;;(require 'pallet)

;; -- directory and load-path stuff --
;; this is all that goes in 'init'. Keep paths, packages, and file locations
;; in here, and configuration in core / other files.

;; all my stuff

(defvar base-dir "~/.emacs.d/")
(defvar vendor-dir (concat base-dir "vendor/"))

;;(add-to-list 'load-path base-dir)
(add-to-list 'load-path (concat base-dir "kongming/"))

;; random bits from the internets
(add-to-list 'load-path vendor-dir)

;; my customized solarized theme
(add-to-list 'custom-theme-load-path (concat vendor-dir "solarized-emacs/"))
(add-to-list 'load-path (concat vendor-dir "solarized-emacs/"))

;; TODO: is this really even necessary with Cask?

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; set emacs default dir to our home.
(setq default-directory "~/")

;; autosave and auto-backup files to the tmp dir.
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq initial-scratch-message "Welcome, Sam. Let's get to work.")

;; for things set by customize-*
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; require core, core will require the rest.

(require 'kongming-core)

(server-start)

;; init.el done here
(provide 'init)
