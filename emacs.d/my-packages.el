(require 'package)
(require 'cl)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(defvar my-packages '(evil
                      paredit
                      evil-leader 
                      auto-complete
                      buffer-stack
                      color-theme
                      css-mode
                      quack geiser
                      zen-and-art-theme
                      shell-switcher
                      circe
                      jabber
                      erc-hl-nicks
                      gist
                      js-comint js2-mode
                      php-mode
                      apache-mode
                      flymake flymake-easy flymake-cursor flymake-php flymake-jslint flymake-json
                      magit)
  "A list of packages to make sure are installed when loaded.")

(defun install-my-packages ()
  (progn
    (message "%s" "refreshing package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    (dolist (p my-packages)
      (unless (package-installed-p p)
        (package-install p)))))

(defun init-my-packages ()
  (progn
    (message "Initilizing packages")
    (dolist (pkg my-packages)
      (let* ((init-file-name (format "~/.emacs.d/inits/%s.el" pkg))
             (package-init-file init-file-name)
             (file-name-no-extension (file-name-sans-extension package-init-file)))
        (when (file-exists-p package-init-file)
          (message "load: %S" file-name-no-extension)
          (load file-name-no-extension 'noerror))))))

(defun load-my-packages ()
  (progn
    (install-my-packages)
    (init-my-packages)))

(provide 'my-packages)
