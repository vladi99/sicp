#lang scheme
;Compiler use applicative-order evaluation, so the program enters in infinite loop.
;If we use normal-order evaluation the test procedure will evaluate to 0 without calling p procedure

(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))
