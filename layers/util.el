(require 'browse-url)

(defun in-github-nucleus ()
"Open a file page in github"
(interactive)
(let (path project-name url)
  (setq path (buffer-file-name))
  (setq path (replace-regexp-in-string "/home/markel/" "" path))
  (setq project-name (nth 1 (split-string path "/")))
  (setq path (replace-regexp-in-string (concat "dev/" project-name) "" path))
  (setq url (concat "https://git.cgm.ag/cgm.us.gat/nucleus-frontend/blob/develop"
		  ;; project-name
		  ;; "/blob/develop"
		  path
		  "#L"
		  (number-to-string (line-number-at-pos))
		  ))
  (browse-url url)
  ))

(defun in-github-fd ()
"Open a file page in github"
(interactive)
(let (path project-name url)
  (setq path (buffer-file-name))
  (setq path (replace-regexp-in-string "/home/markel/" "" path))
  (setq project-name (nth 1 (split-string path "/")))
  (setq path (replace-regexp-in-string (concat "dev/" project-name) "" path))
  (setq url (concat "https://git.cgm.ag/cgm.gss.gat/form-designer/blob/develop"
		  ;; project-name
		  ;; "/blob/develop"
		  path
		  "#L"
		  (number-to-string (line-number-at-pos))
		  ))
  (browse-url url)
  ))

(defun kill-other-buffers ()
  "Kill all other buffers"
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun create-scratch-buffer nil
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))   
