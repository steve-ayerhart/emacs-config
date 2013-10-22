(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(setq
 ibuffer-never-show-predicates '("\\*Completions\\*"
                                 "\\*Tramp*"
                                 "\\*Compile-log*"
                                 "\\*Packages\\*")

 ibuffer-saved-filter-groups '(("default"
                                ("rb" (mode . ruby-mode))
                                ("js" (or
                                       (mode . js2-mode)
                                       (mode . javascript-mode)))
                                ("php" (mode . php-mode))
                                ("elisp" (mode . emacs-lisp-mode))
                                ("eshell" (name . "^\\*eshell"))
                                ("magit" (name . "^\\*magit"))
                                ("irc" (or
                                        (mode . circe-channel-mode)
                                        (mode . circe-server-mode)))
                                ("emacs" (or
                                          (name . "^\\*scratch\\*$")
                                          (name . "^\\*Messages\\*$"))))))
