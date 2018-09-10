#lang racket


(require "smallest-divisor.rkt")


(define (prime? n)
    (= (smallest-divisor n) n))


(provide prime?)

