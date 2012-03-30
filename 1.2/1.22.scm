
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

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


; (search-for-primes 1000 1020) => 1009 (0.014ms), 1013 (0.014ms), 1019 (0.013ms)

; (search-for-primes 10000 10040) => 10007 (0.038ms), 10009 (0.0378ms), 10037 (0.0369ms)

; (search-for-primes 100000 100050) => 100003 (0.102ms), 100019 (0.1028ms), 100043 (0.1021ms)

; (search-for-primes 1000000 1000050) => 1000003 (0.341ms), 1000033 (0.337ms), 1000037 (0.389ms)


; Testing for primes does support the notion that programs on my machine run in time proportional to the number of steps required for the computation, as the times for testing primes around 1000, 10000, 100000, and 1000000 are about 10^1/2 (3.1623) times longer in sequence.
