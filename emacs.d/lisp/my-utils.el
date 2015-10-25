;;; some generic-ish functions

;; indent whole bufer
(defun iwb()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; clear eshell buffer
(defun eshell/clear ()
  "clear the eshell buffer"
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defadvice find-file (around find-files activate)
  "Also find all files within a list of files.  This even works recursively."
  (if (listp filename)
      (while filename
        (find-file (car filename) wildcards)
        (setq filename (cdr filename)))
    ad-do-it))

(defun jump-to-end ()
  "Sets the cursor to the end-of-buffer and the beginning-of-line"
  (interactive)
  (end-of-buffer)
  (end-of-line))

(defun change-theme (theme)
  "Disable all active themes and load THEME."
  (interactive
   (lexical-let ((themes (mapcar 'symbol-name (custom-available-themes))))
     (list (intern (completing-read "Load custom theme: " themes)))))
  (mapc 'disable-theme custom-enabled-themes)
  (load-theme theme t))

(provide 'my-utils)
