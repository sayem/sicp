
; procedure for k-term finite continued function:

(define (cont-frac n d k)
  (define (frac i)
     (if (< i k)
         (/ (n i) (+ (d i) (frac (+ i 1))))
         (/ (n i) (d i))))
  (frac 1))


; approximating 1/phi (0.6180):

(cont-frac (lambda (i) 1.0)
            (lambda (i) 1.0)
            k)


; (cont-frac (lambda (i) 1.0)(lambda (i) 1.0) 3) = 0.6666666666666666

; (cont-frac (lambda (i) 1.0)(lambda (i) 1.0) 4) = 0.6000000000000001

; (cont-frac (lambda (i) 1.0)(lambda (i) 1.0) 5) = 0.625

; (cont-frac (lambda (i) 1.0)(lambda (i) 1.0) 10) = 0.6179775280898876

; (cont-frac (lambda (i) 1.0)(lambda (i) 1.0) 13) = 0.6180371352785146


; cont-frac does approximate 1/phi, as seen above, and k needs to be at least 13 to see it accurate within four places (0.6803)

; cont-frac as an iterative process:

(define (cont-frac-iter n d k)
   (define (frac-iter i result)
       (if (= i 0)
           result
           (frac-iter (- i 1) (/ (n i) (+ (d i) result)))))
   (frac-iter (- k 1) (/ (n k) (d k))))