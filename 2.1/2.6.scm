
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))

(define (inc n)
   (+ n 1))

(define one
   (lambda (f) (lambda (x) (f x))))

(define two
   (lambda (f) (lambda (x) (f (f x)))))


; ((one inc) 5) = 6

; ((two inc) 5) = 7

; ((one inc) 15) = 16

; ((two inc) 15) = 17