

(define (make-interval a b) (cons a b))


; upper-bound procdure: 

(define (upper-bound i) (cdr i))

; lower-bound procdure: 

(define (lower-bound i) (car i))

