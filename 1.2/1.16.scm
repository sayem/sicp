
(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
		 (- counter 1)
		 (* b product))))

(define (even? n)
  (= (remainder n 2) 0))


; need to keep iterating this for product for b^n-1 for odd and 
