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
(defun players-section-string () "PLAYERS")


;;
;;
(defun matches-section-string () "MATCHES")


;;
;;
(defun results-section-string () "RESULTS")


;;
;;
(defun players-section-symbol () 'PLAYERS)


;;
;;
(defun matches-section-symbol () 'MATCHES)


;;
;;
(defun results-section-symbol () 'RESULTS)


;;
;;
(defun is-players-section-p (section)
  ""

  (edebug-tracing "p-section" section)

  (cl-assert (or (null section)
		 (symbolp section)))
  (cl-assert (symbolp (players-section-symbol)))

  (eq section (players-section-symbol))
  )


;;
;;
(defun is-matches-section-p (section)
  ""

  (edebug-tracing "m-section" section)

  (cl-assert (or (null section)
		 (symbolp section)))
  (cl-assert (symbolp (matches-section-symbol)))

  (eq section (matches-section-symbol))
  )


;;
;;
(defun strip-comment (columns)
  "Strip all content from sequence after comment separator."

  (cl-assert (seqp columns))
  (cl-assert (stringp (comment-string)))
  (cl-assert (not (string= (comment-string) "")))

  (seq-take-while
   (lambda (e)
     (cl-assert (stringp e))

     (not (string-prefix-p (comment-string) e))
     )
   columns
   )
  )


;;
;;
(defun parse-players (columns)
  ""

  (cl-assert (listp columns))
  (cl-assert (not (null columns)))

  (edebug-tracing "players" columns)
  )


;;
;;
(defun parse-matches (columns)
  ""

  (cl-assert (listp columns))
  (cl-assert (not (null columns)))

  (edebug-tracing "matches" columns)
  )


;;
;;
(defun write-results ()
  ""
  )


;;
;;
(defun parse-line (start stop section)
  "Parse given line of current buffer."

  (edebug-tracing "section" section)

  (cl-assert (integerp start))
  (cl-assert (integerp stop))
  (cl-assert (or (null section)
		 (symbolp section)))

  (let* ((line (buffer-substring start stop))
	 (columns (strip-comment (split-string line "\t"))))
    ;; (edebug-tracing "line" line)
    (edebug-tracing "columns" columns)
    (if (not (null columns))
	(cond ((is-players-section-p columns) (setq section
						    (players-section-symbol)))
	      ((is-matches-section-p columns) (setq section
						    (matches-section-symbol)))
	      ((players-section-p section) (parse-players columns))
              ((matches-section-p section) (parse-matches columns)))
      )
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
      (edebug-tracing "count" count)
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
