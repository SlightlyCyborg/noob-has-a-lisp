(defun make-song (title artist rating)
  (list :title title :artist artist :rating rating))

(defvar *db* nil)

(defun add-record (song) (push song *db*))

(defun dump-db ()
  (dolist (song *db*)
    (format t "~{~a:~10t~a~%~}~%" song)))

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun song-prompt ()
  (make-song
   (prompt-read "Title:")
   (prompt-read "Artist:")
   (prompt-read "Rating:")
   ))

 (defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun add-songs ()
 (loop (add-record (song-prompt))
    (if (not (y-or-n-p "Another? [y/n]: ")) (return))))

(format t "Here is an example of a simple song db data structure")
(add-songs)
(dump-db)
