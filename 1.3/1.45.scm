
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define tolerance 0.00001)

(define (average x y) (/ (+ x y) 2))

(define (square x) (* x x)) 

(define (cube x) (* x x x)) 

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))


(define (nth-root x n)
  (fixed-point
     ((repeated average-damp 2)
        (lambda (y) (/ x (expt y (- n 1)))))
     1.0))
