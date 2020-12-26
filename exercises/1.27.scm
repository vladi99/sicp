#lang sicp

(#%require (lib "27.ss" "srfi"))

(define (square x) (* x x)) 
  
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
  
(define (fermat-test n test)
  (display test)
  (newline)
  (= (expmod test n n) test))
  
(define (fast-prime? n test) 
  (cond ((= test 2) true)
        ((fermat-test n test) (fast-prime? n (- test 1)))
        (else false))) 

(fast-prime? 561 560)
