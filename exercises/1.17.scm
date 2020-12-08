#lang scheme
(define (is-even n)
  (= (remainder n 2) 0))

(define (double a) (+ a a))

(define (halve a) (/ a 2))

(define (multiply a b)
  (cond ((= b 1) a)
        ((is-even b) (multiply (double a) (halve b)))
        (else (+ a (multiply a (- b 1))))))

(multiply 5 10)
