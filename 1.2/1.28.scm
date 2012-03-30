
(define (square-check x m)
  (if (and (not (or (= x 1) (= x (- m 1))))
           (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))

(define (even? n)
  (= (remainder n 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (square-check (expmod base (/ exp 2) m) m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (miller-rabin n)
  (define (try-it a)
     (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin n) (fast-prime? n (- times 1)))
        (else false)))


; Miller-Rabin test works for primes:

; (miller-rabin 7) => #t

; (miller-rabin 13) => #t

; (miller-rabin 19) => #t

; Unlike the Fermat test, Carmichael numbers don't fool it: 

; (miller-rabin 561) => #f

; (miller-rabin 1105) => #f

; (miller-rabin 1729) => #f

; (miller-rabin 2465) => #f

; (miller-rabin 2821) => #f

; (miller-rabin 6001) => #f

