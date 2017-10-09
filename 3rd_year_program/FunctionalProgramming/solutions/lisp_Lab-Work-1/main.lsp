(setq L1 '(DOG (CAT) FOX ()))
(setq L2 '(RET GET PUT OUT IN))
(setq L3 '(MOV ADD (MUL DEV)))

;; task 1
(
	(
		lambda (a b c) (print (LIST (CAR a) (CAR b) (CAR c)))
	)
	L1 L2 L3
)

;; task 2
(
	DEFUN CONCATENATION (a b c)
       (LIST (NTH 3 a) (NTH 4 b) (NTH 3 c))
)

(print (CONCATENATION L1 L2 L3))

;; task 3
(
	DEFUN DISCRIMINANT (a b c)
			(setq VAR (- (* b b) (* 4 a c)))
			(
				COND ((> VAR 0) (SQRT VAR))
						 ((<= 0) (string "It's not possible"))
			)
)

(print (DISCRIMINANT 1 5 3))
(print (DISCRIMINANT 1 2 1))
(print (DISCRIMINANT 4 -5 1))
