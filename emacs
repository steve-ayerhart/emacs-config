(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d")

(require 'cl)

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (goto-char (point-max))
     (eval-print-last-sexp))))



(setq-default
 indent-tabs-mode nil
 tab-width 2)


(when (boundp 'aquamacs-version)
  (setq
   special-display-regexp nil
   aquamacs-scratch-file nil)

  (tool-bar-mode 0)
  (tabbar-mode -1)
  (one-buffer-one-frame-mode 0))

(global-linum-mode 1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(turn-on-font-lock)

(setq
 el-get-sources '(el-get
                  color-theme
                  color-theme-zen-and-art
                  evil
                  inf-ruby
                  go-mode
                  haml-mode)

 el-get-user-package-directory "~/.emacs.d/el-get-inits")

(el-get 'sync el-get-sources)

(setq
 ;; enable backups
 backup-directory-alist '(("." . "/var/tmp/emacs"))
 backup-by-copying t
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t

 mac-option-modifier 'meta

 ;; tramp
 tramp-default-method "ssh"

 inhibit-splash-screen t


 shell-prompt-pattern "^[^a-zA-Z].*[#$%>] *"

 interprogram-cut-function 'past-to-osx
 interprogram-paste-function 'copy-from-osx)
