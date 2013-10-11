;;; vizier-functions --- utility and other functions.
;;; Commentary:
;;; This should probably be split out into the respective modules, but
;;; some are necessary here.  Will have to figure this out.  TODO: this.

;;; Code:

(defun sure-you-want-to-quit ()
  "Confirm quit."
  (interactive)
  (if (y-or-n-p "Vizier: Are you sure you want to quit? ")
      (save-buffers-kill-terminal 1)
    (message "%s" "Quit canceled.")))

;; FIXME: stray keybinding
(global-set-key (kbd "C-x C-c") 'sure-you-want-to-quit)

(defun save-buffer-delete-frame ()
  "Save the buffer, then close the frame."
  (interactive)
  (save-buffer)
  (delete-frame))

(defun save-buffer-kill-buffer ()
  "Save the buffer if unsaved, and then kill it."
  (interactive)
  (save-some-buffers t)
  (kill-this-buffer))

(defun get-buffers-matching-mode (mode)
  "Return a list of buffers where their `major-mode' is equal to MODE."
  (let ((buffer-mode-matches '()))
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (if (eq mode major-mode)
            (add-to-list 'buffer-mode-matches buf))))
    buffer-mode-matches))

(defun multi-occur-in-this-mode ()
  "Show all lines matching REGEXP in buffers with this major mode."
  (interactive)
  (multi-occur
   (get-buffers-matching-mode major-mode)
   (car (occur-read-primary-args))))

(defun indent-buffer ()
  "Indent the entire buffer."
  (interactive)
  (indent-region (point-min) (point-max)))


(provide 'vizier-functions)
;;; vizier-functions.el ends here
