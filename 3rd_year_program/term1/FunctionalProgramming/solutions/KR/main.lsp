(DEFUN KR (S1 S2 S3 S4) (
  (
    LAMBDA (S1 S2)
      (
        LABELS ((DIFF (SS1 SS2)
          (
            LABELS ((Z (EL S) (COND ((NULL EL) NIL)
        		((NULL S) NIL)
        		((EQUAL EL (CAR S)) T)
        		(T (Z EL (CDR S)))
        		)))

            (
              COND ((NULL SS1) NIL)
            	((NULL SS2) SS1)
            	((NOT (Z (CAR SS1) SS2))
            	(CONS (CAR SS1) (DIFF (CDR SS1) SS2)))
            	(T (DIFF (CDR SS1) SS2))
          	)
          ))) (DIFF S1 S2)
      )
  )

  (
    (
      LAMBDA (S1 S2)
        (
          LABELS ((INTER (SS1 SS2)
            (
              LABELS ((Z (EL S) (COND ((NULL EL) NIL)
            		((NULL S) NIL)
            		((EQUAL EL (CAR S)) T)
            		(T (Z EL (CDR S)))
            		)))

                (
                  COND ((NULL SS1) NIL)
                	((NULL SS2) NIL)
                	((Z (CAR SS1) SS2)
              		(CONS (CAR SS1) (INTER (CDR SS1) SS2)))
                	(T (INTER (CDR SS1) SS2))
              	)
            ))) (INTER S1 S2 )
        )
    )

    (
      (
        LAMBDA (LST)
        (
          LET ((SEEN NIL))
            (LABELS ((R (L) (COND ((NULL L) NIL)
          	(
              (
                (
                  LAMBDA (E SS) (LABELS ((Z (EL S) (COND ((NULL EL) NIL)
              		((NULL S) NIL)
              		((EQUAL EL (CAR S)) T)
              		(T (Z EL (CDR S)))
              		) )) (Z E SS))
                )
                  (CAR L) SEEN
              ) (R (CDR L))
            )
          	(
              T (PUSH (CAR L ) SEEN) (CONS (CAR L) (R (CDR L)))
            ))))(R LST)
            )
          )
      )
     (
      LABELS ((FL (L) (COND ((NULL L) NIL)
          ((ATOM (CAR L)) (CONS (CAR L) (FL (CDR L))))
          (T ((LAMBDA (EL S)
  	  (LABELS
        ((APP (X Y)
          (COND ((NULL X) Y)
            ((ATOM X) (CONS X Y))
            (T (CONS (CAR X) (APP (CDR X) Y)))
        ) )) (APP EL S)
      )
    )
    (FL (CAR L)) (FL (CDR L))))) )) (FL S1)))

    (
      (
        LAMBDA (LST) (LET ((SEEN NIL))
        (
          LABELS ((R (L) (COND ((NULL L) NIL)
          	(
              (
                (
                  LAMBDA (E SS)
                  (
                    LABELS ((Z (EL S) (COND ((NULL EL) NIL)
                  		((NULL S) NIL)
                  		((EQUAL EL (CAR S)) T)
                  		(T (Z EL (CDR S)))))) (Z E SS)
                  )
                )
                (CAR L) SEEN
            )
            (R (CDR L))
          )
        	(T (PUSH (CAR L ) SEEN) (CONS (CAR L) (R (CDR L))))
        	)))(R LST)))) (LABELS ((FL (L) (COND ((NULL L) NIL)
                ((ATOM (CAR L)) (CONS (CAR L) (FL (CDR L))))
                (T ((LAMBDA (EL S)
        	(LABELS ((APP (X Y) (COND ((NULL X) Y)
                ((ATOM X) (CONS X Y))
                (T (CONS (CAR X) (APP (CDR X) Y)))
            ) )) (APP EL S))
          ) (FL (CAR L)) (FL (CDR L))))) )) (FL S2))
    )
  )
	(

  (LAMBDA (S1 S2) (LABELS ((INTER (SS1 SS2) (LABELS ((Z (EL S) (COND ((NULL EL) NIL)
		((NULL S) NIL)
		((EQUAL EL (CAR S)) T)
		(T (Z EL (CDR S)))
		) )) (COND ((NULL SS1) NIL)
	((NULL SS2) NIL)
	((Z (CAR SS1) SS2)
		(CONS (CAR SS1) (INTER (CDR SS1) SS2)))
	(T (INTER (CDR SS1) SS2))
	)))) (INTER S1 S2 )))

  ((LAMBDA (LST) (LET ((SEEN NIL)) (LABELS ((R (L) (COND
	((NULL L) NIL)
	(((LAMBDA (E SS) (LABELS ((Z (EL S) (COND ((NULL EL) NIL)
		((NULL S) NIL)
		((EQUAL EL (CAR S)) T)
		(T (Z EL (CDR S)))
		) )) (Z E SS)))  (CAR L) SEEN) (R (CDR L)))
	(T (PUSH (CAR L ) SEEN) (CONS (CAR L) (R (CDR L))))
	)))(R LST)))) (LABELS ((FL (L) (COND ((NULL L) NIL)
        ((ATOM (CAR L)) (CONS (CAR L) (FL (CDR L))))
        (T ((LAMBDA (EL S)
	(LABELS ((APP (X Y) (COND ((NULL X) Y)
        ((ATOM X) (CONS X Y))
        (T (CONS (CAR X) (APP (CDR X) Y)))
    ) )) (APP EL S))
) (FL (CAR L)) (FL (CDR L))))) )) (FL S3)))
((LAMBDA (LST) (LET ((SEEN NIL)) (LABELS ((R (L) (COND
	((NULL L) NIL)
	(((LAMBDA (E SS) (LABELS ((Z (EL S) (COND ((NULL EL) NIL)
		((NULL S) NIL)
		((EQUAL EL (CAR S)) T)
		(T (Z EL (CDR S)))
		) )) (Z E SS)))  (CAR L) SEEN) (R (CDR L)))
	(T (PUSH (CAR L ) SEEN) (CONS (CAR L) (R (CDR L))))
	)))(R LST))))
  (LABELS ((FL (L) (COND ((NULL L) NIL)
        ((ATOM (CAR L)) (CONS (CAR L) (FL (CDR L))))
        (T ((LAMBDA (EL S)

	(LABELS ((APP (X Y) (COND ((NULL X) Y)
        ((ATOM X) (CONS X Y))
        (T (CONS (CAR X) (APP (CDR X) Y)))
    ) )) (APP EL S))
) (FL (CAR L)) (FL (CDR L))))) )) (FL S4)))) ) )

(print (KR '(1 2 3 4) '(2 3 4 5) '(3 4 5 6) '(3 4 5 7)))


;; zenya (A ∩ B) – (C ∩ D)

;; my variant
;; A υ (B – (C υ D))

;; alex (A ∩ B) υ (C ∩ D)
