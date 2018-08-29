#lang racket


(require rackunit
         "../../src/chapter-1/exercise-1.11.rkt")

(define (assert f arg expected)
    (check-equal? (f arg) expected (format "~a ~a = ~a" f arg expected)))


(define (tests f)
    (assert f 0 0)
    (assert f 1 1)
    (assert f 2 2)
    (assert f 3 3)
    (assert f 4 6)
    (assert f 5 11)
    (assert f 6 20)
    (assert f 7 37)
    (assert f 8 68)
    (assert f 9 125)
    (assert f 10 230)
    (assert f 11 423))
 

(tests f-recursive)

