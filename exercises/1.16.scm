#lang scheme
(define (is-even n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (define (fast-expt-iter b n a res)
    (if (= n 1)
        (* a res)
        (if (is-even n)
            (fast-expt-iter b (/ n 2) a (* res res))
            (fast-expt-iter b (- n 1) (* a res) res))))
  
  (fast-expt-iter b n 1 b))

(fast-expt 2 1000000)
