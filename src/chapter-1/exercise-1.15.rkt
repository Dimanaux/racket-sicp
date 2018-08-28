#lang racket

(define (cube x)
    (* x x x))


(define (p x)
    (- (* 3 x) (* 4 (cube x))))


(define (sine angle)
    (if (not (> (abs angle) 0.1))
        angle
        (p (sine (/ angle 3.0)))))

(sine 12.15)
; ## A
; (sine 12.15)
; (p (sine (/ 12.15 3.0))) ; 1
; (p (sine 4.05))
; (p (p (sine (/ 4.05 3.0)))) ; 2
; (p (p (sine 1.35)))
; (p (p (p (sine (/ 1.35 3.0))))) ; 3
; (p (p (p (sine 0.35))))
; (p (p (p (p (sine 0.116666))))) ; 4
; (p (p (p (p (p (sine 0.03888888)))))) ; 5
; ####
; procedure p wil be called 5 times

; #################################

; ## B
; O(log a)


