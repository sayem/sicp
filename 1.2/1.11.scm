
f(n) = n  if n < 3
f(n) = f(n-1) + 2f(n-2) + 3f(n-3)  if n >= 3


; The following procedure computes f by means of a recursive process:

(define (f n)
  (cond ((< n 3) n)
	(else (+ (f (- n 1))
		 (* 2 (f (- n 2)))
		 (* 3 (f (- n 3)))))))


; The following procedure computes it by means of an iterative process:

0, 1, 2, 4, 11, 25, 59, 142, 335, 796, 1892


(define (f n)
  (f-iter a 0 n))

(define (f-iter a b count)
  (if (< count 3)
      b
      (f-iter (+ b (* 2 (- count 2))  (* (- count 3))  ) a (- count 1))))

           
(f 3) = f(2) + 2f(1) + 3f(0) = 2 + 2 = 4

(f 4) = f(3) + 2f(2) + 3f(1) = 4 + 4 + 3 = 11

(f 5) = f(4) + 2f(3) + 3f(2) = 11 + 8 + 6 = 25

(f 6) = f(5) + 2f(4) + 3f(3) = 25 + 22 + 12 = 59

        f(6)   2f(5)   3f(4) = 59 + 50 + 33 = 142