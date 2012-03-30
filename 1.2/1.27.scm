
(define (square x)
   (* x x))

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

(define (fermat-test a n)
   (= (expmod a n n) a))

(define (fermat n)
   (define (fermat-iter a)
     (cond ((= a 1) true)
           ((not (fermat-test a n)) false)
           (else (fermat-iter (- a 1)))))
   (fermat-iter (- n 1)))


; The Carmichael numbers do fool the Fermat test as shown:

; (fermat 561) => #t

; (fermat 1105) => #t

; (fermat 1729) => #t

; (fermat 2465) => #t

; (fermat 2821) => #t

; (fermat 6601) => #t