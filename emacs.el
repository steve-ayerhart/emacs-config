
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(package-initialize)

;; UTF-8 Encoding
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq eshell-path-env  "/usr/local/bin:/usr/local/sbin:")
(setq exec-path (cons "/usr/local/bin" exec-path))


(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; load up some more various configs and modes
(mapc 'require
      '(cl my-defuns uniquify display))

(add-to-list 'el-get-recipe-path "~/.emacs.d/recipes")

(setq
 ;; el-get variables
 el-get-verbose t
 el-get-user-package-directory "~/.emacs.d/inits"

 my-packages '(evil
               powerline
               magit
               cmake-mode
               evil-surround evil-leader evil-numbers
               erlware-mode
;               zenburn-theme
               php-mode-improved php-completion
               shell-switcher
               ruby-mode inf-ruby ruby-end rinari
               ibuffer-vc
               js2-mode js-comint
               apache-mode nginx-mode
               geiser
               yaml-mode haml-mode markdown-mode
               color-theme-almost-monokai
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

 ;; ediff should use the selected frame
 ediff-window-setup-function 'ediff-setup-windows-plain
 ediff-split-window-function 'split-window-horizontally)

(el-get 'sync my-packages)

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
