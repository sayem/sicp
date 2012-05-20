
(define (cont-frac n d k)
  (define (frac i)
     (if (< i k)
         (/ (n i) (+ (d i) (frac (+ i 1))))
         (/ (n i) (d i))))
  (frac 1))

(define (square x) (* x x))

(define (tan-cf x k)
   (define (n k)
       (if (= k 1)
           x
           (- (square x))))
   (define (d k)
       (- (* 2 k) 1))
   (cont-frac n d k))


; (tan (/ pi 8)) = 0.41421356237309503

; (tan-cf (/ pi 8) 25) = 0.41421356237309503