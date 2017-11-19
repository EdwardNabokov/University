(defun make-ts (production type naming)
(list :production production :type type :naming naming))

;ãëîáàëüíà çì³ííà
(defvar *db* nil)

;äîäàâàííÿ çàïèñó â áàçó äàíèõ
(defun add-record (ts) (push ts *db*))

;âèâîäèòü çì³ñò áàçè äàííèõ â á³ëüø ÷èòàáåëüí³é ôîðì³
(defun dump-db ()
(dolist (ts *db*)
(format t "~{~a:~10t~a~%~}~%" ts)))

;âèáèðàº äåÿêå çíà÷åííÿ ç áàçè äàíèõ
(defun select (selector-fn)
(remove-if-not selector-fn *db*))

;âèáèðàº òèï òåëåâ³ç³éíî¿ ñèñòåìè
(defun type-selector (type)
(lambda (ts) (equal (getf ts :type) type)))

;ãåíåðóº âèðàç âèáîðó, ÿêå ïîâåðòàº âñ³ çàïèñè ïðî òåë. ñèñòåìè, ÿê³ ñï³âïàäàþòü ç³ çíà÷åííÿìè, çàäàíèìè â where
(defun where (&key production type naming)
(lambda (ts)
(and
(if production (equal (getf ts :production) production) t)
(if type (equal (getf ts :type) type) t)
(if naming (equal (getf ts :naming) naming) t))))

;îíîâëåííÿ òà âèêîðèñòàííÿ àðãóìåíòîâ-êëþ÷³â äëÿ çàäàííÿ íîâîãî çíà÷åííÿ
(defun update (selector-fn &key production type naming (ripped nil ripped-p))
(setf *db*
(mapcar
(lambda (row)
(when (funcall selector-fn row)
(if production (setf (getf row :production) production))
(if type (setf (getf row :type) type))
(if naming (setf (getf row :naming) naming)))
row) *db*)))

;âèäàëåííÿ ðÿäê³â ³ç áàçè äàíèõ
(defun delete-rows (selector-fn)
(setf *db* (remove-if selector-fn *db*)))

;ïîøóê çà çàäàíèì çíà÷åííÿì
(defun make-comparison-expr (field value)
(list 'equal (list 'getf 'ts field) value))
