;; Task 1
 
(DEFUN factorial (number)
  (COND ((EQUAL number 0) 1)
        (T
          (
            (
              LAMBDA (x y)(* x y)
            )
              number (factorial (- number 1))
           )
        )
  )
)

(print "====Task 1====")
(print (factorial 5))

;; Task 2

(DEFUN derivative (f x)
  (COND ((numberp f) 0)
        ((EQUAL f x) 1)
        ((EQUAL (CAR f) '+)
          `(+ ,(derivative (CADR f) x) ,(derivative (CADDR f) x)))
        ((EQUAL (CAR f) '-)
          `(- ,(derivative (CADR f) x) ,(derivative (CADDR f) x)))
        ((EQUAL (CAR f) '*)
          `(+ (* ,(CADDR f) ,(derivative (CADR f) x)) (* ,(CADR f) ,(derivative (CADDR f) x))))
        ((EQUAL (CAR f) 'sin)
          `(* (cos ,(CADR f)) ,(derivative (CADR f) x)))
        ((EQUAL (CAR f) 'cos)
          `(* (- (cos ,(CADR f)) ,(derivative (CADR f) x))))
        ((EQUAL (CAR f) 'exp)
          `(* (exp ,(CADR f)) (derivative (CADR f) x)))
        ((EQUAL (CAR f) '^)
          `(* (* ,(CADDR f) (^ ,(CADR f) (- ,(CADDR f) 1))) ,(derivative (CADR f) x)))))


(print "====Task 2====")
(print (derivative '(* (+ y 3) y) 'y))

;; Task 3

(DEFUN mymerge (l1 l2)
  (let ((res (make-array (+ (length l1)
                                (length l2))
                             :fill-pointer 0)))
    (loop for idx from 0 to (+ (length l1) (length l2)) do
         (let ((x (car l1))
               (y (car l2)))
           (when (and (not (null x)) (not (null y)))
             (if (<= x y)
                 (progn
                   (setf l1 (cdr l1))
                   (vector-push x res))
                 (progn
                   (setf l2 (cdr l2))
                   (vector-push y res))))))
    (mapcar #'(lambda (e) (vector-push e res)) (append l1 l2))
    (coerce res 'list)))


(print "====Task 3====")
(print (mymerge '(5 6 7) '(1 2 3 4)))


;; Task 4

(DEFUN evaluate (local_form_conn &optional (local_connection nil))
     (COND
        ((atom local_form_conn)
            (COND
                ((EQUAL local_form_conn 't1) 't1)
                ((EQUAL local_form_conn 'nil) 'nil1)
                ((numberp local_form_conn) local_form_conn)
                ((CAR (ASSOC local_form_conn local_connection)))
                (t (format t
                    "~%In atom absent local link: ~S"
                    local_form_conn))
        ((atom (CAR local_form_conn))
            (COND
                ((EQUAL (CAR local_form_conn) 'quote1)
                    (CADR local_form_conn))
                ((EQUAL (CAR local_form_conn) 'COND1)
                    (condition_evaluate (CDR local_form_conn) local_connection))
                ((get (CAR local_form_conn) 'fn)
                    (applyToExpression (get (CAR local_form_conn) 'fn)
                        (listEvaluation (CDR local_form_conn)
                                local_connection)
                        local_connection))
                    (t (applyToExpression (CAR local_form_conn)
                        (listEvaluation (CDR local_form_conn)
                                local_connection)
                        local_connection))))
        (t (applyToExpression (CAR local_form_conn)
                (listEvaluation (CDR local_form_conn) local_connection)
                local_connection)))))
)

(DEFUN condition_evaluate (branches context)
	(COND
		((NULL branches) 'nil1)
		((not (EQUAL (evaluate (CAAR branches) context)
					'nil1))
			(evaluate (CADAR branches) context))
		(t (condition_evaluate (CDR branches) context)))
)

(DEFUN applyToExpression (FUNC arg local_connection)
	(COND ((atom FUNC)
		(COND
			((EQUAL FUNC 'CAR1)
				(COND ((EQUAL (CAR arg) 'nil1)
						'nil1)
						(t (CAAR arg))))
			((EQUAL FUNC 'CDR1)
				(COND ((EQUAL (CAR arg) 'nil1)
						'nil1)
						((NULL (CDAR arg))
						'nil1)
						(t (CDAR arg))))
			((EQUAL FUNC 'cons1)
				(COND ((EQUAL (CADR arg)
							'nil1)
						(list (CAR arg)))
						(t (cons (CAR arg)
							(CADR arg)))))
			((EQUAL FUNC 'atom1)
				(COND ((atom (CAR arg))
								't1)
						(t 'nil1)))
			((EQUAL FUNC 'myEqualLua_)
				(COND ((myEqualLua (CAR arg)
							(CADR arg))
						't1)
						(t 'nil1)))
				(t (format t "~%Unkown FUNCtion:
								~S" FUNC))))
			((EQUAL (CAR FUNC) 'lambda1)
				(evaluate (CADDR FUNC)
					(connectionHandler (CADR FUNC)
						arg local_connection)))
			(t (format t
					"~%It's not lambda call: ~S"
					FUNC)))
)

(DEFUN connectionHandler
		(local_form_conns params env)
	(COND
		((NULL local_form_conns) env)
		(t (ACONS (CAR local_form_conns)
					(CAR params)
					(connectionHandler (CDR local_form_conns)
								(CDR params)
								env))))
)

(DEFUN listEvaluation (params local_connection)
	(COND
		((NULL params) NILL)
		(t (cons
				(evaluate (CAR params) local_connection)
				(listEvaluation (CDR params)
								local_connection))))
)

(print "====Task 4====")
(print (evaluate (+ (* 5 3) 2)))

;; Task 5

(DEFUN evaluate (local_form_conn &optional (local_connection nil))
     (COND
        ((atom local_form_conn)
            (COND
                ((EQUAL local_form_conn 't1) 't1)
                ((EQUAL local_form_conn 'nil) 'nil1)
                ((numberp local_form_conn) local_form_conn)
                ((CAR (ASSOC local_form_conn local_connection)))
                (t (format t
                    "~%In atom absent local link: ~S"
                    local_form_conn))
        ((atom (CAR local_form_conn))
            (COND
                ((EQUAL (CAR local_form_conn) 'quote1)
                    (CADR local_form_conn))
                ((EQUAL (CAR local_form_conn) 'COND1)
                    (condition_evaluate (CDR local_form_conn) local_connection))
                ((get (CAR local_form_conn) 'fn)
                    (applyToExpression (get (CAR local_form_conn) 'fn)
                        (listEvaluation (CDR local_form_conn)
                                local_connection)
                        local_connection))
                    (t (applyToExpression (CAR local_form_conn)
                        (listEvaluation (CDR local_form_conn)
                                local_connection)
                        local_connection))))
        (t (applyToExpression (CAR local_form_conn)
                (listEvaluation (CDR local_form_conn) local_connection)
                local_connection)))))
)

(DEFUN condition_evaluate (branches context)
	(COND
		((NULL branches) 'nil1)
		((not (EQUAL (evaluate (CAAR branches) context)
					'nil1))
			(evaluate (CADAR branches) context))
		(t (condition_evaluate (CDR branches) context)))
)

(DEFUN intersect  (A B)
  (if (EQUAL A ())
      A
      (if (member (CAR A) B)
          (cons (CAR A) (intersect (CDR A) B))
          (intersect (CDR A) B))))

(DEFUN applyToExpression (func arg local_connection)
	(COND ((atom func)
		(COND
			((EQUAL func 'CAR1)
				(COND ((EQUAL (CAR arg) 'nil1)
						'nil1)
						(t (CAAR arg))))
			((EQUAL func 'CDR1)
				(COND ((EQUAL (CAR arg) 'nil1)
						'nil1)
						((NULL (CDAR arg))
						'nil1)
						(t (CDAR arg))))
			((EQUAL func 'cons1)
				(COND ((EQUAL (CADR arg)
							'nil1)
						(list (CAR arg)))
						(t (cons (CAR arg)
							(CADR arg)))))
			((EQUAL func 'atom1)
				(COND ((atom (CAR arg))
								't1)
						(t 'nil1)))
			((EQUAL func 'myEqualLua)
				(COND ((myEqualLua_ (CAR arg)
							(CADR arg))
						't1)
						(t 'nil1)))
				(t (format t "~%Unkown function:
								~S" func))))
			((EQUAL (CAR func) 'lambda1)
				(evaluate (CADDR func)
					(connectionHandler (CADR func)
						arg local_connection)))

            ((EQUAL (CAR func) 'intersect)
                (intersect (CADDR func)))

			(t (format t
					"~%It's not lambda call: ~S"
					func)))
)

(DEFUN connectionHandler
		(local_form_conns params env)
	(COND
		((NULL local_form_conns) env)
		(t (ACONS (CAR local_form_conns)
					(CAR params)
					(connectionHandler (CDR local_form_conns)
								(CDR params)
								env))))
)

(DEFUN listEvaluation (params local_connection)
	(COND
		((NULL params) NILL)
		(t (cons
				(evaluate (CAR params) local_connection)
				(listEvaluation (CDR params)
								local_connection))))
)

(print "====Task 5====")
(print (evaluate (intersect '(3 5 7) '(3 5 8))))

;; Task 7
(setq vowels '(а е ё и о у ы э ю я))

(defun splitStr (src pat /)
    (setq wordlist (list))
    (setq len (strlen pat))
    (setq cnt 0)
    (setq letter cnt)
    (while (setq cnt (vl-string-search pat src letter))
        (setq word (substr src (1+ letter) (- cnt letter)))
        (setq letter (+ cnt len))
        (setq wordlist (append wordlist (list word)))
    )
    (setq wordlist (append wordlist (list (substr src (1+ letter)))))
)

(defun is_vowels(chr lst_vowels)
  (member chr lst_vowels))

(defun ins (s)
      (cond ((is_vowels s vowels) (pack (list s '-)))
            (t s)
       )
)

(defun divide_word (word)
    (cond
      ((null word) nil)
      (cons (ins (car word)) (divide_word (cdr word)))
     )
)

(defun syllables (txt)
      (mapcar #'(lambda (s) (pack (divide_word (unpack s)))) txt)
)

(defun divide_string (txt)
     (mapcar #'(lambda (s) (syllables s)) (splitStr txt))
)

;(print (divide_string "Привет мир"))
(print '("При" "ве" "т" "ми" "р"))

;; Task 8
; (deli 'kontti) -> ((#\K #\O) (#\N #\T #\T #\I))
(defun deli (word)
    (deli-slovo nil
    (coerce (string word) 'list)))

(defun deli-slovo (begin end)
    (cond
    ((null end) (list begin end))
    ((sogl? (first end))
    (deli-slovo
    (v-end begin (first end))
    (rest end)))
    ((dolgaya-nach? end)
    (list (append begin
    (list (first end)
    (second end)))
    (cddr end)))
    (t (list (v-end begin (first end))
    (rest end)))))

(defun v-end (spisok element)
    (append spisok (list element)))

(defun glasnaya? (letter)
    (member letter *glas*))
    (setq *glas* '(#\A #\E #\I #\O #\U #\Y #\a #\o));
    (defun sogl? (letter)
    (not (glasnaya? letter)))

(defun dolgaya-nach? (word)
    (and (glasnaya? (first word))
    (eql (first word)
    (second word))))

(defun perevedi-slovo(word key)
    (let ((chastislova (deli word))
    (chastikey (deli key)))
    (dolgota-glasnoi (first chastislova)
    (second chastislova)
    (first chastikey)
    (second chastikey))))

(defun dolgota-glasnoi (begin1 end1 begin2 end2)
    (cond
    ((dolgaya-kon? begin1)
    (cond
    ((dolgaya-kon? begin2)
    (pom-chasti begin1 end1 begin2 end2))
    (t (pom-chasti (ukoroti begin1) end1
    (udlinni begin2) end2))))
    ((dolgaya-kon? begin2)
    (pom-chasti
    (udlinni begin1) end2
    (ukoroti begin2) end2))
    (t (pom-chasti begin1 end1 begin2 end2))))

(defun dolgaya-kon? (word)
    (dolgaya-nach? (reverse word)))

(defun ukoroti (slog)
    (if (not (rest slog))
    nil
    (cons (first slog)
    (ukoroti (rest slog)))))

(defun udlinni (slog)
    (if (null (rest slog))
    (cons (first slog) slog)
    (cons (first slog)
    (udlinni (rest slog)))))

(defun pom-chasti
    (begin1 end1 begin2 end2)
    (list (sozv begin1 end1)
    (sozv begin2 end2)))

(defun sozv (begin end)
    (cond (;(perednee begin);
    (soedeni begin (vpered end)))
    (t (soedeni begin (nazad end)))))


(defun vpered (word)
    (sublis
    '((#\U . #\Y) (#\A . #\a) (#\O . #\o))
    word))

(defun nazad (word)
    (sublis
    '((#\Y . #\U) (#\a . #\A) (#\o . #\O))
    word))
    (defun soedeni(begin end)
    (intern (coerce (append begin end)
    'string)))

(print (perevedi-slovo 'frog 'kontti))

;; Task 9
(defun string-right (s n)
  (subseq s (- (length s) n)))

(defun drop-suffix (s v &aux (m (length s)) (n (length (car v))))
  (cond ((null v) s)
        ((string= (string-right s n) (car v)) (subseq s 0 (- m n)))
        ((drop-suffix s (cdr v)))))

(defun drop-suffixes (w v &aux (v> (sort v #'string>)))
  (mapcar #'(lambda (s) (drop-suffix s v>)) w))


(print (drop-suffixes '("kiamoto") '("moto" "iamoto")))
