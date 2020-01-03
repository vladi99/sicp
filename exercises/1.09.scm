#lang scheme
(define (inc a) (+ a 1))
(define (dec a) (- a 1))

;recursive
(define (add a b)
  (if (= a 0)
      b
      (inc (add (dec a) b))))

;iterative
(define (add2 a b)
  (if (= a 0)
      b
      (add2 (dec a) (inc b))))

(add 4 5)
(add2 4 5)
