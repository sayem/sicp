
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

(define (rectangle a b)
  cons ((make-segment a (make-point (car a) (cdr b))) (make-segment b c))
  cons ((make-segment c d) (make-segment d a)))

(define (rect-perim rectangle)
  (+ (* 2 car (car rectangle)) (* 2 cdr (car rectangle))))

(define (rect-perim rectangle)
  (+ (* 2 car (car rectangle)) (* 2 cdr (car rectangle))))

