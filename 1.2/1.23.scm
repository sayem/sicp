
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor))))) 

(define (next n) ; using (next test-divisor) instead of (+ test-divisor 1)
  (if (= n 2)
      3
      (+ n 2)))

(define (square a) (* a a))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))


; timed-prime-test procedure

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n) 
      (report-prime (- (current-inexact-milliseconds) start-time))
      (newline)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (newline))


; search-for-primes procedure

(define (search-for-primes start end)
   (if (even? start)
       (search-for-primes (+ start 1) end)
       (cond ((< start end) (timed-prime-test start)
                            (search-for-primes (+ start 2) end)))))

(define (even? n)
   (= (remainder n 2) 0))


; (search-for-primes 1000 1020) => 1009 (0.0109ms), 1013 (0.010ms), 1019 (0.010ms) ==> avg time = 0.0103ms and avg time of 1.22 = 0.0136ms


; (search-for-primes 10000 10040) => 10007 (0.0258ms), 10009 (0.0249ms), 10037 (0.0251ms) ==> avg time = 0.0253ms and avg time of 1.22 = 0.0376ms


; (search-for-primes 100000 100050) => 100003 (0.0742ms), 100019 (0.0720ms), 100043 (0.0729ms) ==> avg time = 0.073ms and avg time of 1.22 = 0.1023ms


; (search-for-primes 1000000 1000050) => 1000003 (0.221ms), 1000033 (0.219ms), 1000037 (0.219ms) ==> avg time = 0.220ms and avg time of 1.22 = 0.356ms
