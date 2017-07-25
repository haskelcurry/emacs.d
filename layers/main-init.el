(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :config
  (which-key-setup-side-window-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-side-window-max-width 0.33
        which-key-idle-delay 0.05))

(use-package company :ensure t)
(add-hook 'after-init-hook 'global-company-mode)

(use-package projectile :ensure t)
(use-package counsel-projectile :ensure t)
(use-package evil-escape
  :ensure t
  :config
  (evil-escape-mode t)
  (setq-default evil-escape-key-sequence "fd")
  (setq-default evil-escape-delay 0.2))

(use-package powerline
  :ensure t
  :config
  (require 'powerline)
  (powerline-vim-theme))
(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-emacs-theme)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state))

(use-package flx
  :ensure t
  :config
  (setq ivy-re-builders-alist
      '((ivy-switch-buffer . ivy--regex-plus)
        (t . ivy--regex-fuzzy))))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package avy :ensure t)

(use-package smex
  :ensure t
  :config
  (require 'smex))

(use-package doom-themes
  :ensure t
  :config
  (require 'doom-themes)
  (load-theme 'doom-one t))
