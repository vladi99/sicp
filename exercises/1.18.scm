#lang scheme
(define (is-even n)
  (= (remainder n 2) 0))

(define (double a) (+ a a))

(define (halve a) (/ a 2))

(define (multiply a b)
  (define (multiply-iter a b x res)
    (if (= b 1)
        (+ x res)
        (if (is-even b)
            (multiply-iter a (halve b) x (double res))
            (multiply-iter a (- b 1) (+ x res) res))))
  
  (multiply-iter a b 0 a))

(multiply 5 2)
