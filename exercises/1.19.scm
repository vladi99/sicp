#lang scheme
(define (is-even n)
  (= (remainder n 2) 0))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (display count) (newline)
        (cond ((= count 0) b)
              ((is-even count)
               (fib-iter a
                         b
                         (+ (* p p) (* q q))
                         (+ (* 2 p q) (* q q))
                         (/ count 2)))
              (else (fib-iter (+ (* b q) (* a q) (* a p))
                              (+ (* b p) (* a q))
                              p
                              q
                              (- count 1)))))

(fib 1000000)