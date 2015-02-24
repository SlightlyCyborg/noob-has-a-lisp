(load "~/Programs/noob-has-a-lisp/shelisp.lisp")
(load "~/quicklisp/setup.lisp")
(ql:quickload "drakma")


(defun say (words)
  (if (deactivate_voice) (print words)
  (script
   (concatenate 'string "echo " words "| festival --tts"))))

(defun deactivate_voice ()
    (equal (machine-instance) "evo-van"))

(defun respond_dumb(words)
  (say
   (concatenate 'string "I can not reason right now so I will just respond by copying you " words)))

(defun get_my_github_data()
  (setq drakma:*text-content-types* (cons '("application" . "json")
					  drakma:*text-content-types*))
  (drakma:http-request "https://api.github.com/users/slightlycyborg"))

(defun encourage_me ()
  (say "You can do it")
  )

(defclass node () 
  ((text
	  :initarg :text)
	(links
	  :initform (make-array 1 :adjustable t :fill-pointer 0))))

(defun node_link (from_node to_node)
  (vector-push-extend to_node (slot-value from_node 'links)))

(defclass graph ()
  ((nodes
     :initform (make-hash-table :test 'equal))))

(defun add_node (text graph)
  (let ((n (make-instance 'node :text text)))
    (setf (gethash text (slot-value graph 'nodes)) n)))


(defun test ()
  (defvar *graph* (make-instance 'graph))
  (add_node "Hello World" *graph*)
  (add_node "Goodbye World" *graph*)
  (slot-value *graph* 'nodes))

(defun -> (object mem)
  (slot-value object mem))

(defun <> (object mem)
  (gethash mem object))


(defun in_graph (graph text)
  (if (gethash text (-> graph 'nodes)) T
    nil))







  


