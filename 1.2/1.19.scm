
a1 = bq + aq + ap
b1 = bp + aq

a2 = b1q + a1q + a1p = (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
b2 = b1p + a1q  = (bp + aq)p + (bq + aq + ap)q 

a2 = bpq + aqq + bqq + aqq + apq + bqp + aqp + app = b(pq + qq + qp) + a(qq + 2pq) + a(qq + pp)
b2 = bpp + aqp + bqq + aqq + apq = b(pp + qq) + a(2pq + qq)

a --> bq + aq + ap --> b(2pq + qq) + a(2pq + qq) + a(pp + qq)
b --> bp + aq --> b(pp + qq) + a(2pq + qq)


p = p2 + q2
q = 2pq + q2


(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
	((even? count)
	 (fib-iter a
		   b
		   (+ (* p p) (* q q))     ; compute p'
		   (+ (* 2 p q) (* q q))   ; compute q'
		   (/ count 2)))
	(else (fib-iter (+ (* b q) (* a q) (* a p))
			(+ (* b p) (* a q))
			p
			q
			(- count 1)))))