
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define tolerance 0.00001)

(define (phi x)
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
               1.0))


; computing phi (http://en.wikipedia.org/wiki/Golden_ratio) using fixed point transformation:

; (phi 1) = 1.6180327868852458

; (phi 2) = 1.6180327868852458

; (phi 1000) = 1.6180327868852458


