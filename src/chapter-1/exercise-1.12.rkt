#lang racket

(provide pascal-triangle)

(define (pascal-triangle row ind)
    (cond
        ((= ind 1)   1)
        ((= row ind) 1)
        (else (+ (pascal-triangle (- row 1) ind)
                 (pascal-triangle (- row 1) (- ind 1))))))
