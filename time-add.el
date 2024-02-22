;;; time-add.el --- A small function to add two times together.  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Daniel Lin

;; Author:  Daniel Lin <two-e-asteroid@outlook.com>
;; Keywords: convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This adds times of format 'HH:MM:SS'

;;; Code:



(provide 'time-add)

(defun time-add (time-one time-two)
  "Calculates the addition of two times.
Takes two arguments, time-one and time-two, of format 'HH:MM:SS'."
  (let* ((time-one-list (reverse (split-string time-one (rx ":"))))
         (time-two-list (reverse (split-string time-two (rx ":"))))
         (sum-list nil)
         (carry nil))
    (dotimes (index 3)
      (let ((sum (+ (string-to-number (nth index time-two-list)) (string-to-number (nth index time-one-list)))))
        (if (and (not (null carry)))
            (progn (setq sum (1+ sum))
                   (setq carry nil)))
        (if (>= sum 60)
            (progn (setq sum (- sum 60))
                   (setq carry t)))
        (setq sum-list (cons sum sum-list))))
    (format "%s:%s:%s "
            (car sum-list)
            (cadr sum-list)
            (caddr sum-list)))))

;;; time-add.el ends here
