#lang racket

(provide pascal-triangle)

(define (pascal-triangle row index)
    (cond
        (((or (= index 1) (= row index))
            1))
        (else
            (+
                (pascal-triangle (- row 1) index)
                (pascal-triangle (- row 1) (- index 1))))))
