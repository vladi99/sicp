#lang sicp
 (define (filtered-accumulate filter combiner null-value term a next b) 
   (if (> a b) null-value 
     (combiner (if (filter a) (term a) null-value) 
               (filtered-accumulate filter combiner null-value term (next a) next b)))) 

(define (sum-square-primes a b)
  (filtered-accumulate prime? + 0 square (if (< a 2) 2 a) inc b))

(define (product-of-relative-primes n) 
  (define (filter x) 
    (relative-prime? x n)) 
  (filtered-accumulate filter * 1 identity 1 inc n))

; prime

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

; relatively prime

(define (gcd m n) 
  (cond ((< m n) (gcd n m)) 
        ((= n 0) m) 
        (else (gcd n (remainder m n)))))
  
(define (relative-prime? m n) 
  (= (gcd m n) 1))

(product-of-relative-primes 10)
(sum-square-primes 0 100)
