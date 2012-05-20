
; product as a recursive process:

(define (product term a next b)
   (if (> a b)
     1
     (* (term a)
        (product term (next a) next b))))

(define (factorial a)
  (product identity 1 inc a))


(define (identity x) x)

(define (inc n)
  (+ n 1))

(define (square n)
  (* n n))


; Wallis pi approximation (http://en.wikipedia.org/wiki/Wallis_product): 

(define (wallis n)
   (define (term x)
      (/ (* 4.0 (square x))
         (- (* 4.0 (square x)) 1)))
   (* 2.0 (product term 1 inc n)))

; (wallis 1000) = 3.1408077460304042


; product as an iterative process:

(define (product a next b)
  (product-iter a next b 1))

(define (product-iter a next b c)
  (if (> a b) 
      c
      (product-iter (next a) next b (* a c))))



