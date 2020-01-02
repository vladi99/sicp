#lang scheme
(require racket/trace)

(define elipsis 0.00000000000001)

(define (average x y) (/ (+ x y) 2))

;improved good-enough
;the problem of previous one from 1.06 is that for large numbers it enters in infinite loop,
;because of the rounding errors smallest difference between guess^2 and x is larger than elipsis
(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) elipsis))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x) (average guess (/ x guess)))

(define (sqrt x) (sqrt-iter 1.0 x))

(trace good-enough?)

(sqrt 123456789012345678901234567890)
(sqrt 0.0000005)
