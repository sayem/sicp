
; procedure for k-term finite continued function:

(define (cont-frac n d k)
  (define (frac i)
     (if (< i k)
         (/ (n i) (+ (d i) (frac (+ i 1))))
         (/ (n i) (d i))))
  (frac 1))

(define (euler x)
  (cond ((= x 2) x)
        ((= (remainder (- x 2) 3) 0) (- x (/ (- x 2) 3)))
        (else 1)))


; cont-frac for approximating e:

(cont-frac (lambda (i) 1.0) euler k)

; e - 2 = (cont-frac (lambda (i) 1.0) euler 10)

; e = (+ 2 (cont-frac (lambda (i) 1.0) euler 10)) = 2.7182817182817183
