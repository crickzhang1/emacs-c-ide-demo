(use-package ivy
  :init
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key (kbd "C-c s") 'swiper)))

(use-package counsel
  :bind
  (("M-x" . counsel-M-x)
   ("M-y" . counsel-yank-pop)
   ("C-c r" . counsel-recentf)
   ("C-x C-f" . counsel-find-file)
   ("<f1> f" . counsel-describe-function)
   ("<f1> v" . counsel-describe-variable)
   ("<f1> l" . counsel-load-library)
   ("C-h f" . counsel-describe-function)
   ("C-h v" . counsel-describe-variable)
   ("C-h l" . counsel-load-library)))

(use-package counsel-projectile
  :init
  (counsel-projectile-on))

(use-package counsel-gtags)
;; Set company for gtags
(setq company-backends '((company-dabbrev-code company-gtags)))
;; Set counsel-gtags
(add-hook 'c-mode-hook 'counsel-gtags-mode)
(add-hook 'c++-mode-hook 'counsel-gtags-mode)
(define-key counsel-gtags-mode-map (kbd "M-t") 'counsel-gtags-find-definition)
(define-key counsel-gtags-mode-map (kbd "M-r") 'counsel-gtags-find-reference)
(define-key counsel-gtags-mode-map (kbd "M-s") 'counsel-gtags-find-symbol)
(define-key counsel-gtags-mode-map (kbd "M-,") 'counsel-gtags-go-backward)

(provide 'setup-ivy-counsel)
