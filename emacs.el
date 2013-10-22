(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; load up some more various configs and modes
(mapc 'require
      '(cl my-defuns uniquify display))

(setq
 ;; el-get variables
 el-get-verbose t
 el-get-user-package-directory "~/.emacs.d/inits"

 my-packages '(evil
               evil-surround evil-leader evil-numbers
               color-theme color-theme-zen-and-art
               php-mode-improved php-completion
               shell-switcher
               Enhanced-Ruby-Mode inf-ruby ruby-block ruby-end rinari
               buffer-stack
               ibuffer-vc
               js2-mode js-comint
               apache-mode nginx-mode
	       geiser
	       haml-mode markdown-mode
               scss-mode css-mode)
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
                                          (name . "^\\*Messages\\*$")))))

 ;; ediff should use the selected frame
 ediff-window-setup-function 'ediff-setup-windows-plain
 ediff-split-window-function 'split-window-horizontally

 )

(el-get 'sync my-packages)

<<<<<<< HEAD
=======
; tabs
(setq-default
 indent-tabs-mode nil
 truncate-lines t
 tab-width 4)
>>>>>>> 707448c91401fe81dc99332e7b2108f72d31a82e

(show-paren-mode 1)
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
