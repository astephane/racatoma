;;
;; This file is part of racatoma.
;;
;; racatoma is free software: you can redistribute it and/or modify
;; it under the terms of the GNU Affero General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.
;;
;; racatoma is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU Lesser General Public License for more details.
;;
;; You should have received a copy of the GNU Affero General Public
;; License along with racatoma.  If not, see
;; <https://www.gnu.org/licenses/>.
;;


;;
;;
(defun parse-buffer (buffer)
  "Parse current buffer"
  (with-current-buffer buffer
    (beginning-of-buffer)
    (edebug-tracing "while"
     (while (eobp)
       (beginning-of-line)
       (let ((start (line-beginning-position))
	     (stop (line-end-position))
	     (line (buffer-substring start stop)))
	 (edebug-trace "start: %d" start)
	 (edebug-trace "stop : %d" stop)
	 (edebug-trace "line : '%s'" line)
	 )
       (end-of-line)
      (forward-line 1)
      )
     )
    )
  "foo"
  )


;;
;;
(defun racatoma ()
  "Rating Calculator & Tournament Manager"
  (interactive)
  (edebug-tracing "parse-buffer" (parse-buffer (current-buffer)))
  )


;;
;; Debug stuff
;; (edebug-tracing "tracing: " 'racatoma)

;; (edebug-trace "test: " float-pi)
