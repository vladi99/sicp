#lang sicp

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1.0))

(define (factorial n)
  (product identity 1 inc n))

(define (identity x) x)

(define (pi-product a b) 
  (define (pi-term n) 
    (if (even? n) 
       (/ (+ n 2) (+ n 1)) 
       (/ (+ n 1) (+ n 2)))) 
  (product pi-term a inc b))

(factorial 5)
(* (pi-product 1 100000) 4)

(define (product-rec term a next b) 
  (if (> a b) 1 
      (* (term a) (product-rec term (next a) next b)))) 
