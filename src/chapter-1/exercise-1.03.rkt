#lang racket

(provide sum-of-squares-of-two-max)

(define (sum-of-squares-of-two-max x y z)
    (if (> x y)
        (+ (sqr x) (sqr (max y z)))
        (+ (sqr y) (sqr (max x z)))))

