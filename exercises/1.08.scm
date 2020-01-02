#lang scheme
(require racket/trace)

(define elipsis 0.00000000000001)

(define (square x) (* x x))

(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) elipsis))

(define (cube-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (cube-iter (improve guess x) x)))

(define (improve guess x)
  (/
   (+ (/ x (square guess))
      (* 2 guess))
   3))

(define (cube x) (cube-iter 1.0 x))

(trace good-enough?)

(cube 3456789067898)
