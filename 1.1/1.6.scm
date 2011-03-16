
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x)
		     x)))


; If Alyssa tries to use "new-if" to compute square roots with the latter procedure she won't get any result because her interpreter will keep trying to evaluate the consequent expression of "improve guess" ad infinitum, whereas with "if" it would compute the square root because it restricts the consequent expressions to a single expression. Page 19 of SICP mentions how the special form "if" is a restricted type of conditional and that a minor difference between "if" and "cond" is that the (e) part of each "cond" may be a sequence of expressions.

