#lang scheme
(define (f n)
  (cond ((< n 3) 3)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))

(define (g n)
  (define (f-iter a b c count)
    (if (< count 3)
        c
        (f-iter b
                c
                (+ c
                   (* 2 b)
                   (* 3 a))
                (- count 1))))
  (f-iter 3 3 3 n))
