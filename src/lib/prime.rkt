#lang racket


(require "fast-prime.rkt")


(define (prime? n)
    (fast-prime? n 15))


(provide prime?)

