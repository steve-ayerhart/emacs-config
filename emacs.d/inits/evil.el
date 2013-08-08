(evil-mode 1)

(add-to-list 'load-path (concat user-emacs-directory "evil-scout"))
(add-to-list 'load-path (concat user-emacs-directory "evil-rebellion"))
(require 'evil-rebellion)

(setq evil-default-cursor t)

;; esc quits all the things
(fill-keymaps (list evil-normal-state-map
                   evil-visual-state-map)
              [escape] 'keyboard-quit)
(fill-keymaps (list minibuffer-local-map
                   minibuffer-local-ns-map
                   minibuffer-local-completion-map
                   minibuffer-local-must-match-map)
              [escape] 'minibuffer-keyboard-quit)

(evil-define-key 'insert ac-mode-map (kbd "C-j") 'ac-next)
(evil-define-key 'insert ac-mode-map (kbd "C-k") 'ac-previous)
