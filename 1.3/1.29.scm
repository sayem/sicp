
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (inc x) (+ x 1))
  (define (y k)
    (f (+ a (* k h))))
  (define (term k)
    (* (cond ((odd? k) 4)
             ((or (= k 0) (= k n)) 1)
             ((even? k) 2))
       (y k)))
  (*(/ h 3)(sum term 0 inc n)))

(define (cube x) (* x x x))


; (integral cube 0 1 0.01) = 0.24998750000000042

; (simpson-integral cube 0 1 100.0) = 0.24999999999999992

; (integral cube 0 1 0.001) = 0.249999875000001

; (simpson-integral cube 0 1 1000.0) = 0.2500000000000003


; As shown for both n = 100 and n = 1000, Simpson's Rule is a more accurate method for approximating integrals  