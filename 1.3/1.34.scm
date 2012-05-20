
(define (f g)
  (g 2))

(define (square x) (* x x))

(f square) = 4

(f (lambda (z) (* z (+ z 1)))) = 6


(f f) = procedure application: expected procedure, given: 2; arguments were: 2

; When the procedure is substituting f the first time around, we get (f 2), but after it evaluates again we get an error from (2 2) because 2 isn't a procedure