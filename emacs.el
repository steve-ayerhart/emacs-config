(add-to-list 'load-path "~/.emacs.d")

(mapc 'require
     '(cl my-packages my-defuns uniquify display tramp))

;; UTF-8 Encoding
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq default-directory "~")


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
 tramp-shell-prompt-pattern "^.*[#$%>] *"

tramp-debug-buffer t
tramp-verbose 9
 inhibit-splash-screen t

 shell-prompt-pattern "^[^a-zA-Z].*[#$%>] *"

 comint-buffer-maximum-size 10240

 ;; ediff should use the selected frame
 ediff-window-setup-function 'ediff-setup-windows-plain
 ediff-split-window-function 'split-window-horizontally)

                                        ; tabs
(setq-default
 indent-tabs-mode nil
 truncate-lines t
 tab-width 4)

(show-paren-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)


(org-babel-do-load-languages
 'org-babel-load-languages
 '((perl . t)
   (ruby . t)
   (sh . t)
   (python . t)
   (emacs-lisp . t)))

; some global keybindings

(set-default 'tramp-default-proxies-alist (quote (("boner" nil "/ssh:bbb:"))))

(global-set-key (kbd "M-ESC") 'jump-to-end)
(global-set-key (kbd "<f1>") 'magit-status)
