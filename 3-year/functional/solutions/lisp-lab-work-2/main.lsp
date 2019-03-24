;; 1 task

(SETQ L1 '(1 (2 2 3) 4 (3 2 3) 5))
(SETQ L2 '(3 2 3 2))

;; task 1
(
  DEFUN myremove (a_elem b_list)
  (
    COND ((atom b_list) b_list)
         ((EQUAL a_elem (CAR b_list))
         (myremove a_elem (CDR b_list)))

         ('otherwise
         (cons (myremove a_elem (CAR b_list))
               (myremove a_elem (CDR b_list))))
  )
)

(
  DEFUN main_func (a_list b_list)
       (WHEN b_list
              (print a_list)
              (main_func (myremove (CAR b_list) a_list) (CDR b_list))
       )
)

(print "Task 1")
(main_func L1 L2)


;; 2 task

;; 3 task
(DEFUN min2 (x y) (IF (< x y) x y))

(DEFUN mymin (x) (COND ((= (length x) 1) (CAR x))
                      ((= (length x) 2) (min2 (CAR x) (CADR x)))
                      (t (min2 (car x) (mymin (CDR x))))))


(DEFUN myremove (x a) (COND ((null x) nil)
                          ((EQ a (CAR x)) (CDR x))
                          (t (CONS (CAR x) (myremove (CDR x) a)))))


(DEFUN mysort (x) (COND ((null x) nil)
                      (t (CONS (mymin x) (mysort (myremove x (mymin x) ))))))

(print "Task 3 Sort")
(print '(10 20 31 -23 100 -12))
(print (mysort '(10 20 31 -23 100 -12)))


;; 4 task
(
  DEFUN mymerge (a_list b_list)
  (
    COND ((NULL a_list) b_list)
        ((NULL b_list) a_list)
        ((> (CAR a_list) (CAR b_list)) (CONS (car b_list) (mymerge a_list (CDR b_list))))
        (t (CONS (CAR a_list) (CONS (car a_list) (mymerge (CDR a_list) b_list))))
  )
)

(print "Task 4")
(print (mymerge '(1 2 3 4 5) '(6 7 8 9 10 11)))


;; 5 task
(
  DEFUN main_func2 (w n)
  (WHEN w ((lambda (a d)
             (COND ((atom a) (CONS a (main_func2 d n)))
                   ((= n 0) (main_func2 d n))
                   ((CONS (main_func2 a (1- n)) (main_func2 d n)))))
           (CAR w) (CDR w))))

(print "Task 5")
(print (main_func2 '((1 2) 4 (5 (3 (6 7) 8) 9) 10) 0))
(print (main_func2 '((1 2) 4 (5 (3 (6 7) 8) 9) 10) 1))
