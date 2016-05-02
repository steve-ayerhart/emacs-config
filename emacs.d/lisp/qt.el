(require 'qt-pro)

(add-to-list 'auto-mode-alist '("\\.pr[io]$" . qt-pro-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(c-add-style "qt"
             '("k&r"
               (indent-tabs-mode .nil)
               (c-basic-offset . 4)))
(defun qt-c++-mode-hook ()
  (c-set-style "qt"))

(add-hook 'c++-mode-hook 'qt-c++-mode-hook)
