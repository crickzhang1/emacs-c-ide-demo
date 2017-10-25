(setq inhibit-splash-screen t)
;;(menu-bar-mode -1)
(tool-bar-mode -1)
(display-time-mode t)
(display-battery-mode t)
(size-indication-mode t)
(column-number-mode t)
(show-paren-mode t)
(global-hl-line-mode 1)
(global-linum-mode t)
(toggle-save-place-globally t)
;; Disable auto-backup
(setq make-backup-files nil)
;; Enable recent-files list in Menu
(recentf-mode t)
(setq recentf-max-menu-item 10)

(set-frame-font "DejaVu Sans Mono")

;; Show buffer name and file name in title bar
(setq-default frame-title-format "%b (%f)")

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

;; start Emacs server
(server-force-delete)
(server-start)

;; Theme
(use-package monokai-theme
  :config
  (load-theme 'monokai t))

;; Enable adoc-mode for asciidoc docs
;; see for more details: https://github.com/sensorflo/adoc-mode/wiki
(use-package adoc-mode
  :mode ("\\.adoc\\'" . adoc-mode))

;; Highlight lines longer than 80 characters
;; from: https://stackoverflow.com/questions/6344474/how-can-i-make-emacs-highlight-lines-that-go-over-80-chars
;;(add-hook 'c-mode-hook '(lambda () (highlight-lines-matching-regexp ".\\{81\\}" 'hi-yellow)))
;;(add-hook 'c++-mode-hook '(lambda () (highlight-lines-matching-regexp ".\\{81\\}" 'hi-yellow)))

;; Code completion/navigation using GNU Global
;; Please note `file-truename' must be used!
;; http://blog.binchen.org/posts/emacs-as-c-ide-easy-way.html
(setenv "GTAGSLIBPATH" (concat "/usr/include"
                               ":"
                               "/usr/linux/include"
                               ":"
                               (file-truename "~/usr/local/include")
                               ":"
                               (file-truename "~/usr/local/linux/include")))
(setenv "MAKEOBJDIRPREFIX" (file-truename "~/workspace/gtags/"))

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; company
(use-package company
  :init
  (global-company-mode 1)
  (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)

(provide 'setup-general)
