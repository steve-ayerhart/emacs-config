;; esc quits all the things
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; ex commands
(evil-ex-define-cmd "dired" 'dired)
(evil-ex-define-cmd "eval-buffer" 'eval-buffer)

;; auto complete mode
(evil-define-key 'insert ac-mode-map (kbd "C-j") 'ac-next)
(evil-define-key 'insert ac-mode-map (kbd "C-k") 'ac-previous)

;; ruby 
(evil-ex-define-cmd "irb" 'run-ruby)
(evil-ex-define-cmd "rails-c" 'rinari-console)
(evil-ex-define-cmd "rails-s" 'rinari-web-server)
(evil-ex-define-cmd "rails-sr" 'rinari-web-server-restart)


(evil-ex-define-cmd "rake" 'rinari-rake)

(evil-declare-key 'insert ruby-mode-map
                  (kbd "M-f") 'insert-fatarrow)
;; buffer nav
(global-set-key (kbd "C-l") 'next-buffer)
(global-set-key (kbd "C-h") 'previous-buffer)


;; window nav
(global-set-key (kbd "M-h") 'evil-window-left)
(global-set-key (kbd "M-j") 'evil-window-down)
(global-set-key (kbd "M-k") 'evil-window-up)
(global-set-key (kbd "M-l") 'evil-window-right)


;; magit
(global-set-key [f1] 'magit-status)

(provide 'my-keymaps)
