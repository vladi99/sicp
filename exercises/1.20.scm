#lang scheme
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)


;(if (= (remainder 206 40) 0)
;    40
;    (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

;1


;(if (= (remainder 40 (remainder 206 40)) 0)
;    (remainder 206 40)
;    (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

;3

;(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40)) 0)
;    (remainder 40 (remainder 206 40))
;    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

;7

;(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
;    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))


;14 + (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))

;18

;18 operations for normal order for just 4 for applicative order
