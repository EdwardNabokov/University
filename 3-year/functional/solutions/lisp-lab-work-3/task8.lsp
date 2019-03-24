;; Task 9
(defun sideString(s n)
  (subseq s (- (length s) n)))

(defun removePart (s v &aux (m (length s)) (n (length (car v))))
  (cond ((null v) s)
        ((string= (sideString s n) (car v)) (subseq s 0 (- m n)))
        ((removePart s (cdr v)))))

(defun removePartes (w v &aux (v> (sort v #'string>)))
  (mapcar #'(lambda (s) (removePart s v>)) w))


(print (removePartes '("sunnyday") '("day" "moon")))
