(setq packages '(evil
                 color-theme
                 quack geiser paredit
                 zen-and-art-theme
                 shell-switcher
                 magit))

(dolist (pkg packages)
  (let ((init-file (concat "~/.emacs.d/inits/" (symbol-name pkg) ".el")))
    (when (not (require pkg nil t))
      (package-install pkg))
    (if (file-exists-p init-file)
        (load init-file)
      (format "Coult not init %s" init-file))))
