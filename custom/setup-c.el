;; company-c-headers
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
(setq c-default-style "stroustrup"
      c-basic-offset 4)

(use-package cc-mode
  :config
  (define-key c-mode-map  [(control tab)] 'company-complete)
  (define-key c++-mode-map  [(control tab)] 'company-complete)
  )

(use-package function-args
  :config
  (fa-config-default)
  ;; Better parsing for headers
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
  ;; Enable case-insensitive searching
  (set-default 'semantic-case-fold t)
  (semantic-add-system-include "/home/silvery/usr/local/include" 'c++-mode)
  )

(use-package flycheck
  :init
  (global-flycheck-mode)
  )

(use-package flycheck-color-mode-line
  :config
  (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
  )

(use-package flycheck-pos-tip
  :config
  (flycheck-pos-tip-mode)
  )

(use-package flycheck-pkg-config)

(use-package cmake-mode)

(use-package qt-pro-mode
  :ensure t
  :mode ("\\.pro\\'" "\\.pri\\'"))

(use-package preproc-font-lock
  :config
  (preproc-font-lock-global-mode 1)
  )

(provide 'setup-c)
