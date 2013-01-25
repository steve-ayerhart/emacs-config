(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d")

(mapcar 'require
        '(cl
          uniquify))

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (goto-char (point-max))
     (eval-print-last-sexp))))




; aquamacs specific
(when (boundp 'aquamacs-version)
  (setq
   special-display-regexp nil
   aquamacs-scratch-file nil)

  (tool-bar-mode 0)
  (tabbar-mode -1)
  (one-buffer-one-frame-mode 0))


;(global-linum-mode 1)
(scroll-bar-mode -1)
(show-paren-mode 1)
;(turn-on-font-lock)

(setq
 el-get-sources '(el-get
                  ; snippets
;                  yasnippet


                  ; git love
;                  magit

                  ;fancier dired mode
                  dired+

                  ; color themes
                  color-theme
                  color-theme-zen-and-art

                  ; i can't live without my modal editing
                  evil

                  ; ruby / rails stuff
                  inf-ruby rhtml-mode rails-el rinari rvm

                  coffee-mode
                  go-mode
                  yaml-mode
                  sass-mode
                  haml-mode)

 el-get-user-package-directory "~/.emacs.d/el-get-inits")

(el-get 'sync el-get-sources)

(setq
 ;; enable backups
 backup-directory-alist '(("." . "/var/tmp/emacs"))
 backup-by-copying t
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions t
 version-control t

 ;; uniquify
 uniquify-buffer-name-style 'post-forward
 uniquify-separator ":"

 mac-option-modifier 'meta

 ;; tramp
 tramp-default-method "ssh"

 inhibit-splash-screen t

 shell-prompt-pattern "^[^a-zA-Z].*[#$%>] *"

 comint-buffer-maximum-size 10240

 ;; ediff should use the selected frame

 ediff-window-setup-function 'ediff-setup-windows-plain
 ediff-split-window-function (if (> (frame-width) 150)
                                 'split-window-horizontally
                               'split-window-vertically)

 ;; copy/paste 
 interprogram-cut-function 'past-to-osx
 interprogram-paste-function 'copy-from-osx)

; truncate long buffers
(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

; tabs
(setq-default
 indent-tabs-mode nil
 tab-width 4)


;; get the correct path 
(setenv "PATH" (shell-command-to-string "/bin/bash -l -c 'echo -n $PATH'"))
