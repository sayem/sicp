
(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))


; It's apparent that the test fails for very small numbers. As an example, the square root of 0.0003 is 0.0173. However, when done using the good-enough? test above in the sqrt procedure you get 0.0344, which is a significant difference from the actual answer. The reason this happens is simply because of the 0.001 tolerance that's set in the good-enough? test.

; For very large numbers, such as 30 trillion, good-enough? test also fails. The square root of 30 trillion is 17,320,508, but when attempted with the sqrt procedure the result is never computed as there's limited precision between the large numbers and the program just crashes. 

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) (* guess .001))) 

; Modifying the good-enough? test so that it's a relative tolerance (* guess 0.001) accounts for extremities in scale and works better for both very large and very small numbers. 
