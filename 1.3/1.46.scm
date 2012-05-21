
; iterative procedure for testing and improving guesses:

(define (iterative-improve good-enough? improve)
   (define (iter-imp guess)
     (if (good-enough? guess)
         guess
         (iter-imp (improve guess))))
   iter-imp)


(define (average x y) (/ (+ x y) 2))
(define (square x) (* x x))
(define tolerance 0.00001)

(define (sqrt x)
   ((iterative-improve (lambda (guess)
                         (< (abs (- (square guess) x))
                            tolerance))
                       (lambda (guess)
                         (average guess (/ x guess))))
   1.0))


; (sqrt 9) = 3.000000001396984

; (sqrt 16) = 4.000000636692939

; (sqrt 25) = 5.000000000053722