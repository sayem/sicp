
Pascal's triangle: 

    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
   ...


; Recursive procedure for computing elements of Pascal's triangle: 

(define (triangle row column)
  (pascal a b))

(define (pascal a b)
  (cond ((= (or a b) 0) 0)
	((> b a) 0)
	((= b 1) 1)
	((= a b) 1)
	(else (+ (pascal (- a 1) (- b 1)) (pascal (- a 1) b)))))
