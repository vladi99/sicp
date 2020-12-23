#lang sicp

(define (square x) (* x x)) 
  
(define (smallest-divisor n) 
  (find-divisor n 2)) 
  
(define (find-divisor n test-divisor) 
  (cond ((> (square test-divisor) n) n) 
        ((divides? test-divisor n) test-divisor) 
        (else (find-divisor n (+ test-divisor 1))))) 
  
(define (divides? a b) 
  (= (remainder b a) 0)) 
  
(define (prime? n) 
  (= n (smallest-divisor n))) 
  
(define (timed-prime-test n) 
  (start-prime-test n (runtime))) 
  
(define (start-prime-test n start-time) 
  (if (prime? n) 
      (report-prime n (- (runtime) start-time)))) 
  
(define (report-prime n elapsed-time) 
  (newline) 
  (display n) 
  (display " *** ") 
  (display elapsed-time))
  
(define (search-for-primes lower upper) 
  (define (iter n) 
    (cond ((<= n upper) (timed-prime-test n) (iter (+ n 2))))) 
  (iter (if (odd? lower) lower (+ lower 1)))) 
  

(search-for-primes 1000000000 1000000021)
(search-for-primes 10000000000 10000000061)
(search-for-primes 100000000000 100000000057)
(search-for-primes 1000000000000 1000000000063) 
