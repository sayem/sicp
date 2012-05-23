
(define (make-segment start-segment end-segment)
  (cons start-segment end-segment))

(define (make-point x-point y-point)
  (cons x-point y-point))

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define (average x y) (/ (+ x y) 2.0))

(define (midpoint-segment x)
  (cons (average (car (car x)) (car (cdr x))) (average (cdr (car x)) (cdr (cdr x)))))


; (midpoint-segment (make-segment (make-point 3 4) (make-point 10 10))) = (6.5 . 7.0)

; (midpoint-segment (make-segment (make-point 1 2) (make-point 4 19))) = (2.5 . 10.5)

; (midpoint-segment (make-segment (make-point 4 4) (make-point 19 6))) = (11.5 . 5.0)