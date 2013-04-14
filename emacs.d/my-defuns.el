;; indent whole bufer
(defun iwb()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; setup clipboards
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(defun toggle-eshell ()
  (interactive)
  (execute-kbd-macro
   (symbol-function (if (string= "eshell-mode" (eval 'major-mode))
                        'eshell-visor-off
                      'eshell-visor-on))))
                         
(provide 'my-defuns)
