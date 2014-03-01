;;; kongming-org -- org config
;;; Commentary:
;; My org configuration
;;; Code:

(require 'org)
(require 'org-mobile)

;; Set to the location of your Org files on your local system
(setq org-directory "~/git/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/git/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

(provide 'kongming-org)
;;; kongming-org.el ends here
