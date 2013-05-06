(add-to-list 'load-path user-emacs-directory)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(require 'package)
(package-refresh-contents)
(package-initialize)

(add-hook 'after-init-hook '(lambda () (load "~/.emacs.d/inits.el")))

(mapc 'require
      '(cl my-defuns my-keymaps uniquify))


(tool-bar-mode -1)
(setq visible-bell 1)

(global-linum-mode 1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(turn-on-font-lock)

                                        ; always fullscreen
(set-frame-parameter nil 'fullscreen 'fullboth)
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))

(setq
 ;; backups
 backup-directory-alist `((".*" . ,temporary-file-directory))
 auto-save-file-name-transforms `((".*" ,temporary-file-directory))

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

 ;; copy/paste
 interprogram-cut-function 'paste-to-osx
 interprogram-paste-function 'copy-from-osx)

                                        ; truncate long buffers
(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

                                        ; tabs
(setq-default
 indent-tabs-mode nil
 tab-width 4)

(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

(custom-set-faces
 '(default ((t (:height 140 :width normal :family "Inconsolata")))))

(add-to-list 'auto-mode-alist '("emacs" . lisp-interaction-mode))

(put 'dired-find-alternate-file 'disabled nil)
