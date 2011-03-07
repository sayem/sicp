
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

Ben Bitdiddle will be able to see whether his interpreter is using applicative-order evaluation by checking the latter procedure. The first procedure is recursive, so when he evaluates the latter procedure with an interpreter that uses applicative-order evaluation it will display an error at the (test x y) combination. The procedure will keep trying to evaluate (p) first before even moving to the if conditional, which will keep calling (p) and be stuck.

If he's using an interpreter with normal-order evaluation though then the procedure will evaluate to 0 because y won't be substituted for the recursive (p) until the if conditional is fully expanded. 