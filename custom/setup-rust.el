(use-package cargo)
(use-package rust-mode
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq company-tooltip-align-annotations t)
  )



;; racer
(use-package racer
  :config
  (setq racer-cmd "~/.cargo/bin/racer")
  (setq racer-rust-src-path "~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src")

  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  )

(use-package flycheck-rust
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  )
(provide 'setup-rust)
