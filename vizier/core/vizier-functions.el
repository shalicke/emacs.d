(defun save-buffer-delete-frame ()
  (interactive)
  (save-buffer)
  (delete-frame))

(defun save-buffer-kill-buffer ()
  (interactive)
  (save-some-buffers t)
  (kill-this-buffer))

(eval-when-compile
  (require 'cl))

(defun get-buffers-matching-mode (mode)
  "Returns a list of buffers where their major-mode is equal to MODE"
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
  (interactive)
  (indent-region (point-min) (point-max)))
