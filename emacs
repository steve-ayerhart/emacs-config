(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d")

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (setq el-get-verbose t)
    (eval-print-last-sexp)))

(setq-default tab-width 2)

(setq my:el-get-packages
      '(el-get
        evil
        escreen
        haml-mode
        auto-complete
        auto-complete-ruby
        rvm
        sass-mode
        yaml-mode
        ruby-block
        rinari
        magit
        quack
        color-theme
        color-theme-zen-and-art
        undo-tree))

(setq
 el-get-sources
 '((:name evil
          :after (lambda ()

                   ;; almost all my keymaps require evil
                   (mapcar 'require
                           '(tramp
                             my-keymaps
                             my-defuns))

                   (evil-mode 1)
                   (setq-default evil-shift-width 2)))
   (:name coffee-mode (lambda ()
                        (add-hook 'coffee-mode-hook
                                  '(lambda ()
                                     (set (make-local-variable 'tab-width) 2)))))

   (:Name magit
          :after (lambda ()
                   (evil-set-initial-state 'magit 'normal)))
   (:name color-theme
          :after (lambda ()
                   (color-theme-initialize)
                   (setq color-theme-is-global t)
                   (eval-after-load "color-theme" '(color-theme-zen-and-art))))))

(el-get 'sync)




(setq-default indent-tabs-mode nil)
(global-linum-mode 1)
(scroll-bar-mode nil)
(show-paren-mode 1)
(turn-on-font-lock)

;; aquamacs specific
(modify-frame-parameters (selected-frame) '((alpha . 90)))
(tabbar-mode -1)
(one-buffer-one-frame-mode -1)

(require 'ssh)
(setq
 ;; enable backups
 backup-directory-alist '(("." . "/var/tmp/emacs"))
 backup-by-copying t
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t


                                        ; do not open certain buffers in special windows/frame (aquamacs)
 special-display-regex nil
 mac-option-modifier 'meta

 ;; tramp
 tramp-default-method "ssh"

 inhibit-splash-screen t

 ;; assign cpy/paste
 interprogram-cut-function 'past-to-osx
 interprogram-paste-function 'copy-from-osx)

(setq shell-prompt-pattern "^[^a-zA-Z].*[#$%>] *")

(add-to-list 'tramp-default-proxies-alist
             '(".*" "\\`root\\'" "/:ssh:%h:"))
(add-to-list 'tramp-default-proxies-alist
             '((regexp-quote (system-name)) nil nil))

