#lang scheme
;procedure that takes two argumenrs and returns
;first plus absolute value of the second one

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
