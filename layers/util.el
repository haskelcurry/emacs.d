(require 'browse-url)
(defun in-github ()
"Open a file page in github"
(interactive)
(let (path project-name url)
    (setq path (buffer-file-name))
    (setq path (replace-regexp-in-string "/home/markel/" "" path))
    (setq project-name (nth 1 (split-string path "/")))
    (setq path (replace-regexp-in-string (concat "dev/" project-name) "" path))
    (setq url (concat "https://git.cgm.ag/cgm.us.g3/nucleus/blob/develop"
		    ;; project-name
		    ;; "/blob/develop"
		    path
		    "#L"
		    (number-to-string (line-number-at-pos))
		    ))
    (browse-url url)
    ))
