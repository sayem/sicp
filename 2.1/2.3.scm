
(define (make-segment start-segment end-segment)
  (cons start-segment end-segment))

(define (make-point x-point y-point)
  (cons x-point y-point))

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (rectangle x y) (cons x y))

(define (width r)
   (abs (- (x-point (car r)) (x-point (cdr r)))))

(define (height r)
   (abs (- (y-point (car r)) (y-point (cdr r)))))

(define (perimeter r)
   (* 2 (+ (width r) (height r))))

(define (area r)
   (* (width r) (height r)))


; (define x (make-point 2 5))
; (define y (make-point 8 18))
; (define r (rectangle x y))

; (width r) = 6
; (height r) = 13

; (perimeter r) = 38
; (area r) = 78
