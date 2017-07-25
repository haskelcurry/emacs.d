(use-package evil
  :ensure t
  :config
  (require 'evil)
  (evil-mode t))

(evil-define-operator evil-destroy (beg end type register yank-handler)
  "delete without yanking text"
  (evil-delete beg end type 95 yank-handler))

(define-key evil-insert-state-map (kbd "C-h") 'delete-backward-char)
(define-key evil-insert-state-map (kbd "C-d") 'evil-delete-char)
(define-key evil-normal-state-map "d" 'evil-destroy)
(define-key evil-normal-state-map "m" 'evil-delete)
