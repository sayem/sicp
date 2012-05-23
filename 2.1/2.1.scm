
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
        (newline)
        (display (numer x))
        (display "/")
        (display (denom x)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (and (> n 0) (< d 0))
        (cons (/ (* n -1) g) (/ (* d -1) g))
        (cons (/ n g) (/ d g)))))


; (print-rat (make-rat 3 -4)) = -3/4

; (print-rat (make-rat -3 4)) = -3/4

; (print-rat (make-rat 3 4)) = 3/4
