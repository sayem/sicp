
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; This procedure adds a and b together, and uses the special form "if" to include a conditional on b, which checks whether it's negative or not. If b is negative, the procedure subtracts b from a (- as the operator), in which case the negative b is negated thereby resulting in a + b. If b is positive, then the procedure has + as the operator, which also results in a + b.  