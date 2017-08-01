(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :init (ivy-mode t)
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
