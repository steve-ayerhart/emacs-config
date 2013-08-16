(require 'jabber)

(when (file-exists-p "~/.private.el")
  (load-file "~/.private.el"))

(setq
 jabber-account-list `(("steveerhart@bonerbonerboner.com/emacs" (:port . 5222) (:password . jabber-password) (:connection-type . starttls)))
 jabber-roster-line-format "%a %n"
 jabber-roster-show-title nil
 jabber-auto-reconnect t
 jabber-show-offline-contacts nil
 jabber-debug-log-xml t
 jabber-chatstates-confirm nil
 jabber-backlog-number 30)
