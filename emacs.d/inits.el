(setq packages '(evil
                 color-theme
                 quack geiser paredit
                 zen-and-art-theme
                 shell-switcher
                 js-comint
                 js2-mode
                 flymake
                 flymake-cursor
                 flymake-jslint
                 flymake-php
                 flymake-json
                 php-extras
                 magit))

(dolist (pkg packages)
  (let ((init-file (concat "~/.emacs.d/inits/" (symbol-name pkg) ".el")))
    (when (not (require pkg nil t))
      (package-install pkg))
    (if (file-exists-p init-file)
        (load init-file)
      (format "Coult not init %s" init-file))))
