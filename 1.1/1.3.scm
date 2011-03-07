
(define (sum-of-squares x y)
	(+ (* x x) (* y y)))

(define (f a b c)
	(if (and (< a b) (< a c))
		(sum-of-squares b c)
		(if (< b c)
			(sum-of-squares a c)
			(sum-of-squares a b))))



