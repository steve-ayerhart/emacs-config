(evil-mode 1)

; helper function
(defun set-default-mode-to-normal (mode)
  (evil-set-initial-state mode 'normal))

(add-to-list 'load-path (concat user-emacs-directory "evil-scout"))
(add-to-list 'load-path (concat user-emacs-directory "evil-rebellion"))
(require 'evil-rebellion)

(mapcar 'set-default-mode-to-normal
        '(magit-status-mode
          magit-mode
          org-mode
          magit-log-mode
          magit-commit-mode))

(evil-set-initial-state 'magit-log-edit-mode 'insert)

(setq evil-default-cursor t
      evil-emacs-state-cursor  '("red" box) ; BE CAREFUL WE ARE IN EMACS MODE!!!!
      evil-insert-state-cursor '("white" bar)
      evil-visual-state-cursor '("white" hollow)
      evil-normal-state-cursor '("white" box))

;; esc quits all the things
(fill-keymaps (list evil-normal-state-map
                    evil-visual-state-map)
              [escape] 'keyboard-quit)
(fill-keymaps (list minibuffer-local-map
                    minibuffer-local-ns-map
                    minibuffer-local-completion-map
                    minibuffer-local-must-match-map)
              [escape] 'minibuffer-keyboard-quit)
