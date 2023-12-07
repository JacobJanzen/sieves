;;; sieve.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 Jacob Janzen
;;
;; Author: Jacob Janzen <jacob.a.s.janzen@gmail.com>
;; Maintainer: Jacob Janzen <jacob.a.s.janzen@gmail.com>
;; Created: December 07, 2023
;; Modified: December 07, 2023
;; Version: 0.0.1
;; Homepage: https://github.com/JacobJanzen/sieves
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;  Description: An implementation of the Sieve of Eratosthenes in Emacs Lisp


(defun sieve (max-val)
  "Run the sieve of eratosthenes up to a max of max-val"
  (setq sieve (make-vector max-val t)) ; define vector to hold sieve

  ;; unset 0 and 1 as they are never prime
  (setq i 0)
  (while (< i 2)
    (aset sieve i nil)
    (setq i (+ i 1)))

  ;; follow sieve of eratosthenes algorithm to fill sieve
  (setq top (sqrt max-val))
  (while (< i top)
    (when (aref sieve i)
      (setq j (+ i i))
      (while (< j max-val)
        (aset sieve j nil)
        (setq j (+ j i))))
    (setq i (+ i 1)))

  ;; print results
  (setq i 0)
  (setq first t)
  (while (< i max-val)
    (when (aref sieve i)
      (if first
          (setq first nil)
        (princ ", "))
      (prin1 i))
    (setq i (+ i 1)))
  (princ "\n"))

(sieve 1000000)

;;; sieve.el ends here
