
; Prove that Fib(n) is the closest integer to phi^n/(5)^1/2. Use induction and the definition of the Fibonacci numbers 
; to prove that Fib(n) = (phi^n - psi^n)/(5)^1/2

Fib(n) = (phi^n - psi^n)/(5)^1/2

phi = (1 + (5)^1/2)/2
psi = (1 - (5)^1/2)/2


if n = 1:

Fib(1) = (phi^1 - psi^1)/(5)^1/2

1 = (((1 + (5)^1/2)/2) - ((1 - (5)^1/2)/2))/(5)^1/2
1 = (5)^1/2/(5)^1/2
1 = 1

if n = k:

Fib(k) = (phi^k - psi^k)/(5)^1/2
Fib(k-1) = (phi^(k-1) - psi^(k-1))/(5)^1/2

Fib(k+1) = Fib(k) + Fib(k-1)
         = ((phi^k - psi^k)/(5)^1/2) + ((phi^(k-1) - psi^(k-1)))/(5)^1/2
         = (phi^(k-1) * (phi + 1) - psi^(k-1) * (psi + 1))/(5)^1/2  ; phi^2 = phi + 1, also true for psi
         = (phi^(k+1) - psi^(k+1))/(5)^1/2 ; Q.E.D. --> Fib(n) can be approximated by phi, the golden ratio 1.618034

