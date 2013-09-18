(when (file-exists-p "~/.private.el")
  (load-file "~/.private.el"))

(setq circe-network-options `(("bbb"
                               :host "bonerbonerboner.com"
                               :tls t
                               :port 7667
                               :nick "serhart"
                               :reduce-lurker-spam t
                               :user "steve"
                               :pass ,bbb-password ; set in ~/.private.el
                               ))
      circe-default-quit-message "Leaving"
      circe-default-part-message "Leaving"
      lui-flyspell-p t
      lui-max-buffer-size 30000
      lui-flyspell-alist '((".*" "american")))
