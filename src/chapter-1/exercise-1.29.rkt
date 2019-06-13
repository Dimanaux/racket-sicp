#lang racket

; Exercise 1.29.
; Simpson's Rule is a more accurate method of numerical
; integration than the method illustrated above. Using
; Simpson's Rule, the integral of a function f between a
; and b is approximated as
;
; h/3 * [y(0) + 4y(1) + 2y(2) + 4y(3) + 2y(4) + ...
;        ... + 2y(n-2) + 4y(n-1) + y(n)]
; ; sub indeces in round parentheses
;
; where h = (b - a)/n, for some even integer n, and
; yk = f(a + kh). (Increasing n increases the accuracy of
; the approximation.) Define a procedure that takes as
; arguments f, a, b, and n and returns the value of the
; integral, computed using Simpson's Rule. Use your
; procedure to integrate cube between 0 and 1
; (with n = 100 and n = 1000), and compare the results to
; those of the integral procedure shown above.
;
; > (integral cube 0 1 0.01)
; 0.24998750000000042
; > (integral cube 0 1 0.001)
; 0.249999875000001

(provide simpson-rule
         prime?
         integral)

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))

(define (integral f a b dx)
    (define (add-dx x) (+ x dx))
    (* (sum f (+ a (/ dx 2.0)) add-dx b)
        dx))

(define (simpson-rule f a b n)
    (define even-n (if (even? n) n (+ n 1)))
    (define h (/ (- b a) even-n))
    (define (next t) (if (= t 2) 4 2))
    (define (iter i acc term)
        (if (>= i n)
            acc
            (iter
                (+ i 1)
                (+ acc (* term (f (+ a (* i h)))))
                (next term))))
    (* h (+ (f a) (iter 1 0 4) (f b)) 1/3))

(define prime? simpson-rule)
