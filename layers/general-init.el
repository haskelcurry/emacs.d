(defun alternate-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))

(defun ivy-with-thing-at-point (cmd)
  (let ((ivy-initial-inputs-alist
         (list
          (cons cmd (thing-at-point 'symbol)))))
    (funcall cmd)))

(defun counsel-ag-thing-at-point ()
  (interactive)
  (ivy-with-thing-at-point 'counsel-ag))

(require 'use-package)
(use-package general
  :ensure t
  :config
  (general-evil-setup t)
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"

   "w"   '(:ignore t :which-key "Windows")
   "ws"  'split-window-below
   "wv"  'split-window-right
   "wh"  'evil-window-left
   "wl"  'evil-window-right
   "wj"  'evil-window-down
   "wk"  'evil-window-up
   "wd"  'delete-window

   "f"   '(:ignore t :which-key "Files")
   "ff"  'counsel-find-file
   "fs"  'save-buffer
   "fr"  'counsel-recentf

   "b"   '(:ignore t :which-key "Buffers")
   "bb"  'ivy-switch-buffer
   "bd"  'kill-this-buffer
   "bm"  'kill-other-buffers

   "p"   '(:ignore t :which-key "Project")
   "pf"  'counsel-projectile-find-file
   "pp"  'counsel-projectile-switch-project

   "/"   'counsel-projectile-ag
   "*"   'counsel-ag-thing-at-point
   "TAB" '(alternate-buffer :which-key "prev buffer")
   "SPC" '(avy-goto-word-or-subword-1  :which-key "go to char")

   "a"   '(:ignore t :which-key "Applications")
   "ar"  'ranger
   "ad"  'dired))
