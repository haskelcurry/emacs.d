(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :init (ivy-mode t)
  :bind (:map ivy-mode-map
         ("C-h" . counsel-up-directory)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-alt-done)
         ("C-'" . ivy-avy))
  :config
  (setq ivy-use-virtual-buffers nil)
  (setq ivy-height 20)
  (setq ivy-count-format "(%d/%d) ")
  )

(use-package counsel :ensure t
  :bind*
  (("M-x"     . counsel-M-x)))

(use-package swiper
  :ensure t)
