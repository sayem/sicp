
(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))


; a) In (sine 12.15) procedure p is applied so long as the absolute value of the angle is greater than 0.1, so it's called five times, as seen below:

(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))
(p (p (p (p (p 0.05)))))

; b) (sine a) is evaluated when the division of the angle by 3 is less then 0.1. The space and the number of steps are both logarithmic, O(log3(n)). 


