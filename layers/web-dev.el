(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode t)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (tide-hl-identifier-mode t)
  (company-mode t))

(use-package tide
  :ensure t
  :config
  (setq company-tooltip-align-annotations t)
  (add-hook 'typescript-mode-hook #'setup-tide-mode))

(use-package ng2-mode
  :ensure t)

(use-package js2-mode
  :ensure t)

(use-package rjsx-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode)))

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(use-package web-beautify
  :ensure t
  :config
  (require 'web-beautify))

(use-package evil-matchit
  :ensure t
  :config
  (require 'evil-matchit)
  (global-evil-matchit-mode 1))

(use-package ethan-wspace
  :ensure t
  :config
  (require 'ethan-wspace)
  (setq mode-require-final-newline nil)
  (global-ethan-wspace-mode 1))

(use-package indium
  :ensure t)
