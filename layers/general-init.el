(defun alternate-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun ivy-with-thing-at-point (cmd)
  (let ((ivy-initial-inputs-alist
         (list
          (cons cmd (replace-regexp-in-string "\\$" "$$" (thing-at-point 'symbol))))))
    (funcall cmd)))

(defun counsel-ag-thing-at-point ()
  (interactive)
  (counsel-ag (thing-at-point 'symbol)))

(defun counsel-ag-thing-at-point-root ()
  (interactive)
  (counsel-ag (thing-at-point 'symbol) (projectile-project-root)))

(defun swiper-thing-at-point ()
  (interactive)
  (ivy-with-thing-at-point 'swiper))

(require 'use-package)
(use-package general
  :ensure t
  :config
  (general-evil-setup t)

  (general-define-key
   :states '(normal)

   "/" 'swiper
   "*" 'swiper-thing-at-point)

  (general-define-key
   :keymaps 'ivy-mode-map

   "C-h"  'counsel-up-directory
   "C-j"  'ivy-next-line
   "C-k"  'ivy-previous-line
   "C-l"  'ivy-alt-done
   "C-'"  'ivy-avy)

  (general-define-key
   :keymaps 'company-mode-map

   "C-j"  'company-select-next
   "C-k"  'company-select-previous
   "M-m"  'company-complete-selection
   "M-l"  'company-complete-selection)

  (general-define-key
   :keymaps 'ivy-mode-map
   :states '(insert)

   "C-l" 'ac-complete)

  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"

   "w"   '(:ignore t :which-key "windows")
   "ws"  'split-window-below
   "wv"  'split-window-right
   "wh"  'evil-window-left
   "wl"  'evil-window-right
   "wj"  'evil-window-down
   "wk"  'evil-window-up
   "wd"  'delete-window

   "f"   '(:ignore t :which-key "files")
   "ff"  'counsel-find-file
   "fv"  'ranger
   "fs"  'save-buffer
   "fr"  'counsel-recentf
   "ft"  'neotree-toggle

   "b"   '(:ignore t :which-key "buffers")
   "bb"  'ivy-switch-buffer
   "bd"  'kill-this-buffer
   "bm"  'kill-other-buffers

   "p"   '(:ignore t :which-key "project")
   "pf"  'counsel-projectile-find-file
   "pp"  'counsel-projectile-switch-project

   "s"   '(:ignore t :which-key "search")
   "sd"  'counsel-ag

   "r"   '(:ignore t :which-key "register")
   "ry"  'counsel-yank-pop

   "/"   'counsel-projectile-rg
   "*"   'counsel-ag-thing-at-point-root
   "("   'counsel-ag-thing-at-point
   "TAB" '(alternate-buffer :which-key "prev buffer")
   "SPC" '(avy-goto-word-or-subword-1  :which-key "go to char")

   "c"   '(ng2-open-counterpart :which-key "ng2 counterpart")
   "a"   '(:ignore t :which-key "Applications")))

(define-key global-map (kbd "C-f") 'universal-argument)
(define-key universal-argument-map (kbd "C-u") nil)
(define-key universal-argument-map (kbd "C-f") 'universal-argument-more)
(define-key global-map (kbd "C-u") 'kill-whole-line)
(eval-after-load 'evil-maps
  '(progn
     (define-key evil-motion-state-map (kbd "C-f") nil)
     (define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up)))
