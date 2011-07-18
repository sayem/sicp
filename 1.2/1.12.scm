
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
  (cond ((or (= a b) (= b 1)) 1)
	((> b a) #f)
	(else (+ (pascal (- a 1) (- b 1)) 
		 (pascal (- a 1) b)))))
