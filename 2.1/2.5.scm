
(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

; counts number of times d is divided into n:

(define (num-divs n d)
  (define (iter x count)
    (if (= 0 (remainder x d))
        (iter (/ x d) (+ 1 count))
        count))
  (iter n 0))

(define (car x)
  (num-divs x 2))

(define (cdr x)
  (num-divs x 3))


; (car (cons 9 70)) = 9

; (cdr (cons 9 70)) = 70