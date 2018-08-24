#lang racket

(require rackunit
         "../../src/chapter-1/exercize-1.07.rkt")

(define epsilon 0.001)


(check-= (my-sqrt 2) (sqrt 2) epsilon "my-sqrt 2")
(check-= (new-sqrt 2) (sqrt 2) epsilon "new-sqrt 2")
(check-= (my-sqrt 9) 3 epsilon "my-sqrt 9")
(check-= (new-sqrt 9) 3 epsilon "new-sqrt 9")

