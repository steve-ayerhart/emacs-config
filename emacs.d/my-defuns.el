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

(defun past-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(defun insert-fatarrow ()
  (interactive)
  (insert " => "))

(defun switch-to-eshell ()
  (let ((esh (get-buffer "*eshell*")))
    (if esh
        (switch-to-buffer-here esh)
      eshell)))


(provide 'my-defuns)
