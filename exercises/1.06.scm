#lang scheme
(require racket/trace)	

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
;With new-if stackoverflow exception is thrown. Since compiler use applicative-order.
;It will try to evaluate 'else-clause' which in this case will cause inifnite recursion
;Exercise 1.06 ↑

(define elipsis 0.00000000000001)

(define (square x) (* x x))

(define (average x y) (/ (+ x y) 2))

(define (good-enough? guess x)
  (<
   (abs
    (- (square guess)
       x))
   elipsis))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (average guess (/ x guess))
            x)))

(define (sqrt x) (sqrt-iter 1.0 x))

(trace good-enough?)

(sqrt 25)
