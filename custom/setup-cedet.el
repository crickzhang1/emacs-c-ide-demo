;; (use-package cc-mode)
(use-package semantic
  :config
  (global-semanticdb-minor-mode 1)
  (global-semantic-idle-scheduler-mode 1)
  (global-semantic-stickyfunc-mode 1)
  (semantic-mode 1))

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

;; Enable EDE only in C/C++
(use-package ede
  :config
  (global-ede-mode))

(provide 'setup-cedet)
