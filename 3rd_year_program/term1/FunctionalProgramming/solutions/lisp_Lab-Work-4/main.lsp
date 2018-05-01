(DEFUN SETUP (PROD type naming)
(LIST :PROD PROD :type type :naming naming))

(DEFVAR *db* nil)

(DEFUN add-record (PARAM) (PUSH PARAM *db*))

(DEFUN dump-db ()
(MAKELIST (PARAM *db*)
(format t "~{~a:~10t~a~%~}~%" PARAM)))

(DEFUN select (selector_paramFN)
(DROP-IF-NOT selector_paramFN *db*))

(DEFUN selector (type)
(LAMBDA (PARAM) (equal (GETF PARAM :type) type)))

(DEFUN where (&key PROD type naming)
(LAMBDA (PARAM)
(and
(IF PROD (equal (GETF PARAM :PROD) PROD) t)
(IF type (equal (GETF PARAM :type) type) t)
(IF naming (equal (GETF PARAM :naming) naming) t))))

(DEFUN update (selector_paramFN &key PROD type naming (ripped nil ripped-p))
(SETF *db*
(MAPCAR
(LAMBDA (row)
(WHEN (FUNCALL selector_paramFN row)
(IF PROD (SETF (GETF row :PROD) PROD))
(IF type (SETF (GETF row :type) type))
(IF naming (SETF (GETF row :naming) naming)))
row) *db*)))

(DEFUN delete-rows (selector_paramFN)
(SETF *db* (DROP-IF selector_paramFN *db*)))

(DEFUN COMPARE_EXPRESSIONS (field value)
(LIST 'equal (LIST 'GETF 'PARAM field) value))
