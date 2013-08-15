(when (file-exists-p "~/.private.el")
  (load-file "~/.private.el"))

(setq circe-network-options
      `(("bbb"
         :host "bonerbonerboner.com"
         :tls t
         :port 7667
         :nick "serhart"
         :reduce-lurker-spam t
         :user "steve"
         :pass ,bbb-password ; set in ~/.private.el
         )))
