
f(n) = n  if n < 3
f(n) = f(n-1) + 2f(n-2) + 3f(n-3)  if n >= 3


; The following procedure computes f by means of a recursive process:

(define (f n)
  (cond ((< n 3) n)
	(else (+ (f (- n 1))
		 (* 2 (f (- n 2)))
		 (* 3 (f (- n 3)))))))


; The following procedure computes it by means of an iterative process:

(define (f n)
  (if (< n 3)
      n
      (f-iter 2 1 0 n)))

(define (f-iter a b c count)
  (if (= count 2)
      a
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))