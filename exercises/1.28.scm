#lang sicp
(#%require (lib "27.ss" "srfi"))

(define (square x) (* x x)) 
  
(define (miller-rabin-expmod base exp m) 
  (define (squaremod-with-check x) 
    (define (check-nontrivial-sqrt1 x square) 
      (if (and (= square 1) 
               (not (= x 1)) 
               (not (= x (- m 1)))) 
          0 
          square)) 
    (check-nontrivial-sqrt1 x (remainder (square x) m))) 
  (cond ((= exp 0) 1) 
        ((even? exp) (squaremod-with-check 
                      (miller-rabin-expmod base (/ exp 2) m))) 
        (else 
         (remainder (* base (miller-rabin-expmod base (- exp 1) m)) 
                    m))))
  
(define (miller-rabin-test n)
  (define (try-it a)
    (define (check-it x) 
       (and (not (= x 0)) (= x 1))) 
     (check-it (miller-rabin-expmod a (- n 1) n)))
  (try-it (+ 1 (random-integer (- n 1))))) 
  
(define (fast-prime? n times) 
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false))) 

;test

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

(search-for-primes 1000000000000 3) 
(search-for-primes 10000000000000 3)
(search-for-primes 100000000000000 3)
