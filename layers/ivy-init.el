(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :init (ivy-mode 1)
  :bind (:map ivy-mode-map
         ("C-h" . counsel-up-directory)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-alt-done)
         ("C-'" . ivy-avy))
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 20)
  (setq ivy-count-format "(%d/%d) ")
  )

(use-package counsel :ensure t
  :bind*
  (("M-x"     . counsel-M-x)
  ))

(defun counsel-projectile-ag-word ()
  (interactive)
  (counsel-projectile-ag)
  (ivy-next-history-element))

(use-package swiper
  :ensure t)
