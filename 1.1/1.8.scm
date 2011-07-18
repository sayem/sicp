
(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) (* guess .001))) 

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (average x y)
  (/ (+ x y) 2))

(define (cubert-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubert-iter (improve guess x)
		   x)))

(define (cubert x)
  (cubert-iter 1.0 x))


; This procedure calculates the cube root of x using Newton's method for getting better approximations of y with: (x/y^2 + 2y)/3