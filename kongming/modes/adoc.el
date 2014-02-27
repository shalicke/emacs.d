(require 'adoc-mode)
(add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))
(add-to-list 'auto-mode-alist (cons "\\.ad\\'" 'adoc-mode))
(add-hook 'adoc-mode-hook 'auto-fill-mode)
(add-hook 'adoc-mode-hook (lambda() (buffer-face-mode t)))

(provide 'kongming-adoc)
