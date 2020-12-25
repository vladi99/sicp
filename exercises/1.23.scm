#lang sicp

(define (square x) (* x x)) 
  
(define (smallest-divisor n) 
  (find-divisor n 2)) 
  
(define (find-divisor n test-divisor) 
  (cond ((> (square test-divisor) n) n) 
        ((divides? test-divisor n) test-divisor) 
        (else (find-divisor n (next test-divisor))))) 

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (divides? a b) 
  (= (remainder b a) 0)) 
  
(define (prime? n) 
  (= n (smallest-divisor n))) 
  
(define (timed-prime-test n) 
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time) 
  (if (prime? n) 
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
  

(search-for-primes 1000000000000 3) 
(search-for-primes 10000000000000 3)
(search-for-primes 100000000000000 3)

