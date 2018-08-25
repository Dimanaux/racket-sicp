#lang racket

(require rackunit
         "../../src/chapter-1/exercise-1.08.rkt")

(define eps 0.001)

(check-= (cube-root 8)   2.0 eps "cube root of 8")
(check-= (cube-root 27)  3.0 eps "cube root of 27")
(check-= (cube-root 64)  4.0 eps "cube root of 64")
(check-= (cube-root 125) 5.0 eps "cube root of 125")
(check-= (cube-root 216) 6.0 eps "cube root of 125")
(check-= (cube-root 343) 7.0 eps "cube root of 125")
(check-= (cube-root 512) 8.0 eps "cube root of 125")
(check-= (cube-root 729) 9.0 eps "cube root of 125")
(check-= (cube-root 25) 2.92401773821 eps "cube root of 25")

