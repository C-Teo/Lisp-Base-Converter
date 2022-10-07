(defvar *stack* '())
(defvar *alpha* nil)
(loop for char across "ZYXWVUTSRQPONMLKJIHGFEDCBA" do (setf *alpha* (cons char *alpha*)))

(defun clear-stack ()
  (setf *stack* nil))

(defun toBase (val bas)
  "Converts a value in Base10 to the given Base"
  (when (or (<= bas 1)(> bas 35))
    (print "Invalid Base")
    (return-from toBase nil))
  (when (< val 0)
    (setf val 0))
   (do ()
       ((<= val 0) *stack*)
     (if (<= 10 (mod val bas))
         (push (elt *alpha* (- (mod val bas) 10)) *stack*)
         (push (mod val bas) *stack*))
     (setf val (floor (/ val bas)))))


