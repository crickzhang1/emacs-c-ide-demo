;;; Emacs configuration (C/C++ oriented)
;;
;; Modified from Tuhdo's c-demo
;; see http://tuhdo.github.io/c-ide.html
;;
;; References:
;; * http://book.emacs-china.org/
;; * https://realpython.com/blog/python/emacs-the-best-python-editor/

;; * Using `add-to-list' to add items to existing list one at a time.
;; * Using `add-hook' to specifically customize a package/mode.
;; * Using `global-set-key' to customize key bindings.
;; * Using `setq' to set variables.

;;; Package setup

;; Require >= Emacs 24.x
;; Add MELPA repository.
;; * https://www.emacswiki.org/emacs/ELPA
;; * https://melpa.org/#/getting-started
(require 'package)
(add-to-list 'package-archives
         ;;'("melpa" . "http://melpa.org/packages/") t)
         '("melpa" . "http://elpa.emacs-china.org/melpa/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
;; To install packages automatically if not already present
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)

;; (if (version< emacs-version "24.4")
;;     (require 'setup-ivy-counsel)
;;   (require 'setup-helm)
;;   (require 'setup-helm-gtags))
;; ;; (require 'setup-ggtags)
;; ;;(require 'setup-cedet)
;; (require 'setup-editing)
(require 'setup-c)

;; function-args
(use-package function-args
  :config
  (fa-config-default))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu monokai-theme adoc-mode markdown-mode)))
 '(save-place t)
 '(save-place-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
