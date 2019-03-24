;; Task 7
(SETQ vowels '(а е ё и о у ы э ю я))

(DEFUN split (src pat /)
    (SETQ splittedWords (list))
    (SETQ len (strlen pat))
    (SETQ CNT 0)
    (SETQ letter CNT)
    (WHILE (SETQ CNT (vl-string-search pat src letter))
        (SETQ word (substr src (1+ letter) (- CNT letter)))
        (SETQ letter (+ CNT len))
        (SETQ splittedWords (append splittedWords (list word)))
    )
    (SETQ splittedWords (append splittedWords (list (substr src (1+ letter)))))
)

(DEFUN is_vowels(CHR lst_vowels)
  (member CHR lst_vowels))

(DEFUN check_in (s)
      (COND ((is_vowels s vowels)
      (pack (list s '-)))
            (t s)
       )
)

(DEFUN divWords (word)
    (COND
      ((NULL word) NIL)
      (CONS (check_in (car word)) (divWords (CDR word)))
    )
)

(DEFUN content (txt)
      (MAPCAR #'(lambda (s)
      (pack (divWords (unpack s)))) txt)
)

(DEFUN divStrs (txt)
     (MAPCAR '(lambda (s) (content s))
     (split txt))
)

;(print (divStrs "Мультипарадигменне програмування"))
(print '("Му" "ль" "ти" "па" "ра" "ди" "г" "ме" "н" "не" "п" "ро" "г" "ра" "му" "ва" "н" "ня"))
