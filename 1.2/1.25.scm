
; using fast-expt from 1.2.4 instead:

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))


; (timed-prime-test 1009) => 17.45ms

; (timed-prime-test 10007) => 960.33ms

; (timed-prime-test 10037) => 966.25ms

; As seen above, using the fast-expt procedure from 1.2.4 results in markedly worse performance, compared to what we found with the original expod procedure in 1.24. The reasoning is explained in the footnote on page 52 -- with the original expmod procedure we were able to use successive squaring to still get logarithmic growth, but without ever having to deal with numbers larger than m. 

;-----------------

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100) 
      (report-prime (- (current-inexact-milliseconds) start-time))
      (newline)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (square a) (* a a))

(define (even? n)
   (= (remainder n 2) 0))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))