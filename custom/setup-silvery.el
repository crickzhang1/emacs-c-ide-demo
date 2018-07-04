;;; package --- Summary
;
; Convenience functions for myself

;;; Commentary:

;;; Code:

(defun silvery/copy-buffer-to-file (filename)
  "Save a copy of current buffer to FILENAME!"
  (interactive "File to write? ")
  (let ((bufname (buffer-name)))
    (set-visited-file-name filename)
    (save-buffer)
    (set-visited-file-name nil)
    (rename-buffer bufname)))

(provide 'setup-silvery)
;;; setup-silvery.el ends here
