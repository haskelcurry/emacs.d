(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :diminish (which-key-mode . "w")
  :config
  (which-key-setup-side-window-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-side-window-max-width 0.33
        which-key-idle-delay 0.05))

(use-package company
  :diminish (company-mode . "c")
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

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
  :diminish (flycheck-mode . "f")
  :init (global-flycheck-mode))

(use-package avy :ensure t)

(use-package smex
  :ensure t
  :config
  (require 'smex))

(use-package doom-themes
  :ensure t
  :diminish (undo-tree-mode . "U")
  :config
  (require 'doom-themes)
  (load-theme 'doom-one t))

(use-package smooth-scrolling
  :ensure t
  :config
  (require 'smooth-scrolling)
  (setq scroll-margin 5
	scroll-conservatively 9999
	scroll-step 1))

(use-package yasnippet
  :ensure t
  :diminish (yas-minor-mode . "Y")
  :bind*
  (("M-/"     . yas-expand))
  :config
  (require 'yasnippet)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode 1))

(use-package wgrep
  :ensure t)

(use-package evil-commentary
  :ensure t
  :config
  (require 'evil-commentary)
  (evil-commentary-mode))

(use-package vimish-fold
  :ensure t
  :config
  (require 'vimish-fold)
  (vimish-fold-global-mode t))

(use-package default-text-scale
  :ensure t)

(use-package ranger
  :ensure t)

(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (setq neo-smart-open t)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter))

(use-package auto-package-update
   :ensure t
   :config
   (setq auto-package-update-delete-old-versions t
         auto-package-update-interval 4)
   (auto-package-update-maybe))
