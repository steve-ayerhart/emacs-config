(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(setq url-http-attempt-keepalives nil)

(defvar my-packages
  '(evil magit)
  "A list of packages to ensure are installed at launch.")

(defvar additional-filename
  "~/.emacs.d/additional-packages.el"
  "A string indicating the name of the file to load the additional packages list")

(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(when (file-exists-p additional-filename)
  (load-file additional-filename)
  (setq my-packages (append my-packages additional-packages)))

(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(dolist (p my-packages)
  (let ((file (format "~/.emacs.d/inits/%s.el" (symbol-name p))))
    (when (file-exists-p file)
      (load-file file))))

(provide 'my-packages)
