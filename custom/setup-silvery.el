;;; package --- Summary
;;
;; Convenience functions for myself

;;; Commentary:

;;; Code:

;; Modifed from https://emacs.stackexchange.com/a/5815
(defun silvery/copy-buffer-to-file (filename)
  "Save a copy of current buffer to FILENAME!"
  (interactive "FProvide FILENAME to write? ")
  (let ((bufname (buffer-name))
        (oldfname (buffer-file-name)))
    (set-visited-file-name filename)
    (save-buffer)
    (set-visited-file-name oldfname)
    (rename-buffer bufname)))

(provide 'setup-silvery)
;;; setup-silvery.el ends here
