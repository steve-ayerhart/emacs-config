(add-to-list 'load-path "~/.emacs.d")

;; start emacs daemon
(load "server")
(unless (server-running-p)
  (server-start))

(mapc 'require
      '(cl my-defuns my-keymaps uniquify display))

;; let's get and configure all my packages
(require 'my-packages)
(load-my-packages)

;;; some general customizations
(setq
 ;; backups
 backup-directory-alist `((".*" . ,temporary-file-directory))
 auto-save-file-name-transforms `((".*" ,temporary-file-directory))
 
 ns-pop-up-frames nil

 ;; uniquify
 uniquify-buffer-name-style 'post-forward
 uniquify-separator ":"

 mac-option-modifier 'meta
 mac-command-modifier 'meta

 ;; tramp
 tramp-default-method "ssh"

 inhibit-splash-screen t

 shell-prompt-pattern "^[^a-zA-Z].*[#$%>] *"

 comint-buffer-maximum-size 10240

 ; ibuffer
 ibuffer-never-show-predicates '("\\*Completions\\*"
                                 "\\*Tramp*"
                                 "\\*Compile-log*"
                                 "\\*Packages\\*")
 ibuffer-saved-filter-groups '(("default"
                                ("magit" (name . "^\\*magit:"))
                                ("eshell" (name . "^\\*eshell"))
                                ("elisp" (mode . emacs-lisp-mode))
                                ("js" (mode . javascript-mode))
                                ("php" (mode . php-mode))
                                ("irc" (or
                                        (mode . circe-channel-mode)
                                        (mode . circe-server-mode)))
                                ("emacs" (or
                                          (name . "^\\*scratch\\*$")
                                          (name . "^\\*Messages\\*$")))))

 ;; ediff should use the selected frame
 ediff-window-setup-function 'ediff-setup-windows-plain
 ediff-split-window-function 'split-window-horizontally)

; truncate long buffers
(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

; tabs
(setq-default
 indent-tabs-mode nil
 truncate-lines t
 tab-width 4)

(show-paren-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((perl . t)         
   (ruby . t)
   (sh . t)
   (python . t)
   (emacs-lisp . t)))

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(add-hook 'ibuffer-mode-hook
              (lambda ()
                (ibuffer-switch-to-saved-filter-groups "default")))
