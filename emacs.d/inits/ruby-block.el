(require 'ruby-block)
(add-hook 'ruby-mode-hook
          '(lambda ()
             (ruby-block-mode t)))
