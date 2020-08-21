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
(defun comment-string ()
  "#"
  )


;;
;;
(defun players-section-string ()
  "PLAYERS"
  )


;;
;;
(defun matches-section-string ()
  "MATCHES"
  )


;;
;;
(defun results-section-string ()
  "RESULTS"
  )


;;
;;
(defun players-section-symbol ()
  'PLAYERS
  )


;;
;;
(defun matches-section-symbol ()
  'MATCHES
  )


;;
;;
(defun results-section-symbol ()
  'RESULTS
  )


;;
;;
(defun is-empty-p (list)
  "Check if list is empty, considering comments."

  (cl-assert (listp list))
  (cl-assert (stringp (car list)))
  (cl-assert (stringp (comment-string)))
  (cl-assert (not (string= (comment-string) "")))

  (or (null list)
      (string-prefix-p (comment-string)
		       (car list)))
  )


;;
;;
(defun parse-players (columns)
  ""

  (cl-assert (listp columns))

  (if (not (is-empty-p columns))
      (edebug-tracing "players: " columns)
    )
  )


;;
;;
(defun parse-matches (columns)
  ""

  (cl-assert( listp columns))

  (if (not (is-empty-p columns))
      (edebug-tracing "matches: " columns)
    )
  )


;;
;;
(defun write-results ()
  ""
  )


;;
;;
(defun is-players-section-p (section)
  ""

  (cl-assert (symbolp section))

  (eq section (players-section-symbol))
  )


;;
;;
(defun is-matches-section-p (section)
  ""

  (cl-assert (symbolp section))

  (eq section (matches-section-symbol))
  )


;;
;;
(defun parse-line (start stop section)
  "Parse given line of current buffer."

  (cl-assert (integerp start))
  (cl-assert (integerp stop))
  (cl-assert (symbolp section))

  (let* ((line (buffer-substring start stop))
         (columns (split-string line "\t")))
    ;; (edebug-tracing "line: " line)
    ;; (edebug-tracing "columns: " columns)
    (cond ((players-section-p section) (parse-players line))
          ((matches-section-p section) (parse-matches line))
          (t (write-results)))
    )
  )


;;
;;
(defun parse-buffer (buffer)
  "Parse current buffer."

  (with-current-buffer buffer
    (beginning-of-buffer)
    (let ((count 0))
      (while (not (eobp))
        (beginning-of-line)
        (let* ((start (line-beginning-position))
               (stop (line-end-position))
               (section nil))
          (parse-line start stop section)
          (setq count (1+ count))
          )
        (end-of-line)
        (forward-line 1)
        )
      (edebug-tracing "count: " count)
      )
    )
  )


;;
;;
(defun racatoma ()
  "Rating Calculator & Tournament Manager"

  (interactive)
  (edebug-tracing
   "parse-buffer"
   (parse-buffer (current-buffer))
   )
  )


;;
;; Debug stuff
;; (edebug-tracing "tracing: " 'racatoma)

;; (edebug-trace "test: " float-pi)
