#lang sicp

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value 
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum-integers a b)
  (accumulate + 0 identity a inc b))

(define (factorial n)
  (accumulate * 1 identity 1 inc n))

(sum-integers 1 10)
(factorial 5)
