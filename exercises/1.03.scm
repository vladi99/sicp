#lang scheme
(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (larger-two a b c)
  (if (>= a b)
      (if (>= b c)
          (list a b)
          (list a c))
      (if (>= a c)
          (list b a)
          (list b c))))

(define (sum-squares-of-larger-two a b c)
  (apply sum-of-squares (larger-two a b c)))
