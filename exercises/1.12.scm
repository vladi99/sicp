#lang scheme
(define (pascal row col)
  (cond ((= col 0) 1)
        ((= row 0) col)
        (else (/ (* row
                    (pascal (- row 1)
                            (- col 1)))
                 col))))
