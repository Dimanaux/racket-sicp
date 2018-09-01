#lang racket


(provide fast-*)


(define (double x)
    (+ x x))


(define (halve x)
    (/ x 2))


(define (fast-* a b)
    (define (iter a b product)
        (cond
            ((= a 0) product)
            ((even? a) (iter (halve a) (double b) product))
            (else (iter (- a 1) b (+ product b)))))
    (iter a b 0))


(define (test-*)
    (define (assert x y)
        (if (= (fast-* x y) (* x y))
            (println "OK")
            (println (format "OPPS ~a * ~a != ~a" x y (fast-* x y)))))
    (assert 2 5)
    (assert 1 8)
    (assert 5 2)
    (assert 8 1)
    (assert 0 4)
    (assert 4 0)
    (assert 3 7)
    (assert 7 3)
    (assert 10 2)
    (assert 2 10)
    (assert 3 8))

(test-*)

