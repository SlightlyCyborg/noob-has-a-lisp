(load "/home/cyborg/Programs/noob-has-a-lisp/shelisp.lisp")
(load "~/quicklisp/setup.lisp")
(ql:quickload "drakma")

(defun say (words)
  (script
   (concatenate 'string "echo " words "| festival --tts")))

(defun respond_dumb(words)
  (say
   (concatenate 'string "I can not reason right now so I will just respond by copying you " words)))

(defun get_my_github_data()
  (setq drakma:*text-content-types* (cons '("application" . "json")
					  drakma:*text-content-types*))
  (drakma:http-request "https://api.github.com/users/slightlycyborg"))



