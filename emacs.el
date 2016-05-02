(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(add-to-list 'load-path (concat (getenv "HOME") "/.emacs.d/lisp"))
(add-to-list 'exec-path (concat (getenv "HOME") "/.gem/ruby/2.2.0/bin"))
(setq eshell-path-env (concat (getenv "PATH") ":" (getenv "HOME") "/.gem/ruby/2.2.0/bin"))
(setenv "PATH" (concat (getenv "PATH") ":" (getenv "HOME") "/.gem/ruby/2.2.0/bin"))

(setq default-directory (getenv "HOME"))

(mapc 'require
      '(cl packages my-utils uniquify my-display tramp midnight flymake))

;; UTF-8 Encoding
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


(setq
 ;; backups
 backup-directory-alist `((".*" . ,temporary-file-directory))
 auto-save-file-name-transforms `((".*" ,temporary-file-directory))

 explicit-shell-file-name "/usr/bin/screen"
                                        ; osx stuff
 ns-pop-up-frames nil
 mac-option-modifier 'meta
 mac-command-modifier 'meta

 show-parent-style 'expression 

 ;; uniquify
 uniquify-buffer-name-style 'post-forward
 uniquify-separator "|"

 ;; tramp
 tramp-default-method "ssh"
 tramp-shell-prompt-pattern "^.*[#$%>] *"
 tramp-debug-buffer t
 tramp-verbose 9

 inhibit-splash-screen t

 shell-prompt-pattern "^[^a-zA-Z].*[#$%>] *"

 comint-buffer-maximum-size 10240

 ibuffer-saved-filter-groups '(("default"
                                ("dired" (mode . dired-mode))
                                ("org" (mode . org-mode))))

 custom-file (concat (getenv "HOME") "/.emacs-custom.el")

 ;; ediff should use the selected frame
 ediff-window-setup-function 'ediff-setup-windows-plain
 ediff-split-window-function 'split-window-horizontally)

;; tabs
(setq-default
 indent-tabs-mode nil
 truncate-lines t
 tab-width 4)

(show-paren-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)

;;; lisp

(show-paren-mode t)
(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (eldoc-mode t)))
(add-hook 'lisp-interaction-mode-hook (lambda ()
                                        (eldoc-mode t)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((perl . t)
   (ruby . t)
   (sh . t)
   (python . t)
   (emacs-lisp . t)))

;; some global keybindings

(set-default 'tramp-default-proxies-alist (quote (("boner" nil "/ssh:bbb:"))))

(global-set-key (kbd "M-ESC") 'jump-to-end)
(global-set-key (kbd "<f1>") 'magit-status)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

(if (file-exists-p custom-file)
    (load custom-file))
