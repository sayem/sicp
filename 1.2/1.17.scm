
(define (even? n)
  (= (remainder n 2) 0))

(define (double a)
  (+ a a))

(define (half a)
  (/ a 2))


; the following procedure takes a logarithmic number of steps for multiplication:

(define (* a b)
  (cond ((= b 0) 1)
	((= b 1) a)
	((even? b) (double (* a (half b))))
	(else (+ a (* a (- b 1))))))




