(ns macrotest.core)

(defmacro foreach [body as entity func]
  `(doseq [~entity ~body] ~func))

(foreach ["Waldo" "Brat" "Wally"] :as dog
  (print dog))
