
; procedure for smoothing a function:

(define (smooth-operator f)
  (lambda (x)
    ((/ (+ (f (- x dx)) 
           (f x) 
           (f (+ x dx))) 
        3))))


(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))


; n-fold smoothed function:

(define (n-fold-smooth f dx n)
  (repeated (smooth-operator f dx) n))

