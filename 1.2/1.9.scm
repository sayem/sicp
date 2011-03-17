
(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))


(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))


; Using the substitution model in evaluating (+ 4 5), the first procedure is a recursive process; it has a deferred operation in the "inc" operation and it expands and then contracts as the operations are performed:

(+ 4 5)
(inc (+ (dec 4) 5))
(inc (+ (- 4 1) 5))
(+ 1 (+ (- 4 1) 5))
(+ 1 (+ 3 5))
(+ 1 8)
9 

; The second procedure on the other hand is an iterative process, as it has a fixed number of state variables, which is the (dec a) and (inc b), and the process doesn't grow or shrink:

(+ 4 5)
(+ (dec 4) (inc 5))
(+ (- 4 1) (+ 1 5))
(+ 3 6)
9
