#lang racket


(define (sum-of-max-squares x y z)
    (cond (= (max x y) (max y z)) (+ (sqr y) (sqr (max x z)))
          (else (+ (sqr (max x y) (max y z))))))

