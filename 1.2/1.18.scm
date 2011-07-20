
(define (even? n)
  (= (remainder n 2) 0))

(define (double a)
  (+ a a))

(define (half a)
  (/ a 2))


; iterative process for multiplying two integers:

(define (mult a b)
  (mult-iter a b 0))

(define (mult-iter a b product)
  (cond ((= b 0) product)
	((even? b) (mult-iter (double a) (half b) product))
	(else (mult-iter a (- b 1) (+ a product)))))


