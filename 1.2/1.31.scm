
(define (product a next b)
  (if (> a b)
      1
      (* a (product (next a) next b))))

(define (factorial a)
  (product 1 inc a))


--- 2 3 4 5 6: inc 1 on odd;  3 4 5 6 inc 1 on even


