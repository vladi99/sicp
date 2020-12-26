#lang sicp

(#%require (lib "27.ss" "srfi"))

(define (square x) (* x x)) 
  
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
  
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1))))) 
  
(define (fast-prime? n times) 
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false))) 

; test

(define (timed-prime-test n) 
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time) 
  (if (fast-prime? n 100) 
      (report-prime n (- (runtime) start-time)) 
      #f))

(define (report-prime n elapsed-time) 
  (display n) 
  (display "***") 
  (display elapsed-time) 
  (newline)) 

(define (search-for-primes n counter) 
  (if (even? n) 
      (s-f-p (+ n 1) counter) 
      (s-f-p n counter)))

(define (s-f-p n counter) 
  (if (> counter 0) 
      (if (timed-prime-test n) 
          (s-f-p (+ n 2) (- counter 1)) 
          (s-f-p (+ n 2) counter)) 
      "COMPUTATION COMPLETE"))
  

(search-for-primes 10000 3) 
