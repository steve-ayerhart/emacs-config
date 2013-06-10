(add-to-list 'load-path user-emacs-directory)

(require 'my-packages)
(load-my-packages)
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
; interprogram-cut-function 'paste-to-osx
; interprogram-paste-function 'copy-from-osx
 )

                                        ; truncate long buffers
(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

                                        ; tabs
(setq-default
 indent-tabs-mode nil
 tab-width 4)

(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "nil" :slant normal :weight normal :height 145 :width normal)))))

;(add-to-list 'auto-mode-alist '("emacs" . lisp-interaction-mode))

(put 'dired-find-alternate-file 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#FAF9F8" "#dc322f" "#859900" "#b58900" "#268BD2" "#d33682" "#00877C" "#000000"])
 '(background-color "#202020")
 '(background-mode dark)
 '(cursor-color "#cccccc")
 '(custom-safe-themes (quote ("a9ba2503710aa81ad20d02e2960944aea2cab256c3026da6476bc966e6fd7235" "7a2c92b6267b84ae28a396f24dd832e29a164c1942f1f8b3fe500f1c25f8e09d" "465498990110b4a0b7612af46dd9c369aa83bdb997fc3a0b060d648ba800065a" "d921083fbcd13748dd1eb638f66563d564762606f6ea4389ea9328b6f92723b7" "085b401decc10018d8ed2572f65c5ba96864486062c0a2391372223294f89460" "3bd9497fb8f39c28ab58a9e957152ba2dc41223c23c5520ef10fc7bd6b222384" "4c9ba94db23a0a3dea88ee80f41d9478c151b07cb6640b33bfc38be7c2415cc4" "24cb1b9c182198f52df7cebf378ee9ecca93a2daeb9a90049a2f1f556119c742" "60a2ebd7effefeb960f61bc4772afd8b1ae4ea48fae4d732864ab9647c92093a" "88d556f828e4ec17ac074077ef9dcaa36a59dccbaa6f2de553d6528b4df79cbd" "3c708b84612872e720796ea1b069cf3c8b3e909a2e1da04131f40e307605b7f9" "3d6b08cd1b1def3cc0bc6a3909f67475e5612dba9fa98f8b842433d827af5d30" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" "978ff9496928cc94639cb1084004bf64235c5c7fb0cfbcc38a3871eb95fa88f6" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" "60e70079a187df634db25db4bb778255eaace1ef4309e56389459fb9418b4840" default)))
 '(fci-rule-color "#F2F2F2")
 '(foreground-color "#cccccc")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors (quote (("#F2F2F2" . 0) ("#B4C342" . 20) ("#69CABF" . 30) ("#6DA8D2" . 50) ("#DEB542" . 60) ("#F2804F" . 70) ("#F771AC" . 85) ("#F2F2F2" . 100))))
 '(vc-annotate-background "#2b2b2b")
 '(vc-annotate-color-map (quote ((20 . "#bc8383") (40 . "#cc9393") (60 . "#dfaf8f") (80 . "#d0bf8f") (100 . "#e0cf9f") (120 . "#f0dfaf") (140 . "#5f7f5f") (160 . "#7f9f7f") (180 . "#8fb28f") (200 . "#9fc59f") (220 . "#afd8af") (240 . "#bfebbf") (260 . "#93e0e3") (280 . "#6ca0a3") (300 . "#7cb8bb") (320 . "#8cd0d3") (340 . "#94bff3") (360 . "#dc8cc3"))))
 '(vc-annotate-very-old-color "#dc8cc3"))
