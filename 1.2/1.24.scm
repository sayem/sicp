
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

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))


; (timed-prime-test 1009) => 1.40ms

; (timed-prime-test 1013) => 1.48ms

; (timed-prime-test 1019) => 1.56ms

; (timed-prime-test 10007) => 1.89ms

; (timed-prime-test 10009) => 1.79ms

; (timed-prime-test 10037) => 1.89ms

; (timed-prime-test 100003) => 3.88ms

; (timed-prime-test 100019) => 4.19ms

; (timed-prime-test 100043) => 4.11ms

; (timed-prime-test 1000003) => 4.96ms

; (timed-prime-test 1000033) => 5.14ms

; (timed-prime-test 1000037) => 5.34ms 


; Because the Fermat test has O(log n) growth, we would expect the times from 1,000 to 1,000,000 to exhibit a similar pattern. (timed-prime-test 1009) resulted in 1.40 milliseconds whereas (timed-prime-test 1000003) resulted in 3.88 milliseconds, which is about 3x longer. Trying to test this out for much larger numbers may demonstrate this better though:


; 100000007 => 7.32ms

; 1000000007 => 8.52ms

; 2000000011 => 11.89ms

; 3000000019 => 12.44ms

; 4000000007 => 12.72ms

; 4294967029 => 12.73ms