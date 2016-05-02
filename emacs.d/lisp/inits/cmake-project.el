(require 'cmake-project)

(defun maybe-cmake-project-hook ()
  (if (file-exists-p "CMakeLists.txt")
      (progn (cmake-project-mode)
             (flymake-mode))))

(add-hook 'c-mode-hook 'maybe-cmake-project-hook)
(add-hook 'c++-mode-hook 'maybe-cmake-project-hook)
