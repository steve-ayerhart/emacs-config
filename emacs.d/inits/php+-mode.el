;(require 'php+-mode)

(autoload 'php+-mode "php+-mode" "Major mode for editing php" t)

(add-to-list 'auto-mode-alist '("\\.php$" . php+-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php+-mode))
