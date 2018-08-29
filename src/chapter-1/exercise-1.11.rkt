#lang racket


(provide f-recursive
         f-iterative)


(define (f-recursive n)
    (cond ((< n 3) n)
        (else
            (+
                (f-recursive (- n 1))
                (f-recursive (- n 2))
                (f-recursive (- n 3))))))


(define (f-iterative n)
    (f-iter 0 1 2 n))


(define (f-iter a b c count)
    (if (= count 0)
        c
        (f-iter
            (+ a b c)
            (+ b c)
            a
            (- count 1))))


