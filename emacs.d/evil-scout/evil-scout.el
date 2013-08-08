;;; evil-scout.el -- alternative <leader> implementation for evil

;; Copyright (C) 2013 by Albert Krewinkel

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary

;;; WRITEME

;;; Code

(require 'evil)

(defgroup evil-scout nil
  "Alternative <Leader> support for evil."
  :group 'evil
  :prefix 'evil-scout-)

(defcustom evil-scout-keys-alist '((leader . ",")
                                   (local-leader . "\\"))
  "Assoc list of <leader> types and assigned keys."
  :type 'list
  :group 'evil-scout)

(defcustom evil-scout-keys-in-non-normal '(leader local-leader)
  "List of <leader>s which should be available in non-normal mode."
  :type 'list
  :group 'evil-scout)

(defcustom evil-scout-global-leaders '(leader)
  "List of global <leader>s."
  :type 'list
  :group 'evil-scout)

(defcustom evil-scout-non-normal-modifier 'control
  "Modifier key to use <leader> in non-normal mode."
  :type 'symbol
  :group 'evil-scout)

;;; Utilities

(defun evil-scout-build-key-sequence (&rest keys)
  "Build a sequence from individual keys and subsequences.
Accepted arguments types are characters, strings or vectors.

Example:
  (evil-scout-build-key-sequence [(control ?e)] \"vi\" ?l)
  =>  [(control 101) 118 105 108] ; i.e. \"\C-e vil\""
  (cl-flet ((to-key-sequence (key)
              (cond ((characterp key)
                     (list key))
                    ((stringp key)
                     (read-kbd-macro key t))
                    ((sequencep key)
                     (cl-coerce key 'vector)))))
    (let ((result))
      (dolist (key keys (apply #'vconcat (nreverse result)))
        (push (to-key-sequence key) result)))))

;; Access the configs
(defun evil-scout-key-sequence (leader &optional keys)
  "Get key sequence for `leader'."
  (evil-scout-build-key-sequence
   (cdr (assoc leader evil-scout-keys-alist))
   keys))

(defun evil-scout-in-non-normal-state-p (leader)
  "If `leader' should be accessible in non-normal state."
  (find leader evil-scout-keys-in-non-normal))

(defun evil-scout-non-normal-key-sequence (leader &optional keys)
  "The key sequence for `leader' in non-normal state."
  (when (evil-scout-in-non-normal-state-p leader)
    (evil-scout-build-key-sequence
     (vector (cons evil-scout-non-normal-modifier
                   (coerce (evil-scout-key-sequence leader) 'list)))
     keys)))

;;; Leader Key
(defmacro define-leader-key (leader keymap key def)
  `(let ((leader ,leader)
         (keymap ,keymap)
         (key    ,key)
         (def    ,def))
     (let ((non-normal-seq (evil-scout-non-normal-key-sequence leader key))
           (leader-seq     (evil-scout-key-sequence leader key)))
       (evil-define-key 'emacs  keymap non-normal-seq def)
       (evil-define-key 'insert keymap non-normal-seq def)
       (evil-define-key 'visual keymap non-normal-seq def)
       (evil-define-key 'motion keymap non-normal-seq def)
       (evil-define-key 'normal keymap leader-seq def))))

(defmacro define-global-leader (key def)
  `(let ((key    ,key)
         (def    ,def))
     (let ((non-normal-seq (evil-scout-non-normal-key-sequence 'leader key))
           (leader-seq     (evil-scout-key-sequence            'leader key)))
       (define-key evil-emacs-state-map  non-normal-seq def)
       (define-key evil-insert-state-map non-normal-seq def)
       (define-key evil-visual-state-map non-normal-seq def)
       (define-key evil-motion-state-map non-normal-seq def)
       (define-key evil-normal-state-map leader-seq     def))))

(defmacro evil-scout-reset (leader keymap)
  `(define-leader-key ,leader ,keymap nil nil))

(provide 'evil-scout)
;;; evil-scout.el ends here
