(load "/home/cyborg/Programs/noob-has-a-lisp/shelisp.lisp")

(defun say (words)
  (script
   (concatenate 'string "echo " words "| festival --tts")))

(defun respond_dumb(words)
  (say
   (concatenate 'string "I can not reason right now so I will just respond by copying you " words)))
