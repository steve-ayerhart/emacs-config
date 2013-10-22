(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(package-initialize)

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
               magit
               evil-surround evil-leader evil-numbers
               zenburn-theme
               php-mode-improved php-completion
               shell-switcher
               Enhanced-Ruby-Mode inf-ruby ruby-block ruby-end rinari
               buffer-stack
               ibuffer-vc
               js2-mode js-comint
               apache-mode nginx-mode
               geiser
               yaml-mode haml-mode markdown-mode
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

(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((perl . t)
   (ruby . t)
   (sh . t)
   (python . t)
   (emacs-lisp . t)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#000000" "#d54e53" "#afd75f" "#e7c547" "#5f87d7" "#af87d7" "#5f87d7" "#dadada"])
 '(buffer-stack-untracked (quote ("KILL" "*Compile-Log*" "*Compile-Log-Show*" "*Warnings*" "*Help*" "*Group*" "*Completions*" "*Messages*" "*Packages*" "*magit-process*" "*magit-commit*" "*magit-edit-log" "*Ediff Registry*")))
 '(custom-safe-themes (quote ("159bb8f86836ea30261ece64ac695dc490e871d57107016c09f286146f0dae64" "4aafea32abe07a9658d20aadcae066e9c7a53f8e3dfbd18d8fa0b26c24f9082c" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" default)))
 '(fci-rule-character-color "#1c1c1c")
 '(fci-rule-color "#1c1c1c"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "nil" :slant normal :weight normal :height 140 :width normal)))))
