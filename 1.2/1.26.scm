
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

; Using explicit multiplication instead of square results in much slower performance. Reason being that (expmod base (/ exp 2) m) is called twice as many times, and consequently, what was originally a linear recursive process has turned into a tree recursion. Each (expmod base (/ exp 2) m) branches out to more and more child processes, and so with explicit multiplication we have O(log 2^n), which is O(n).