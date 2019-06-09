#lang racket

; Lisa P. Hacker says that expmod does lot of excessive
; work. She suggests this procedure.

(define (expmod base exp m)
    (remainder (fast-expt base exp) m))

; Is she right?

; No. This procedure works with numbers ~ base ^ exp
; - these are huge numbers compare to exp.
; while original expmod works with numbers ~ exp.
; For example Lisa's (expmod 2 17 7)
; (remainder (fast-expt 2 17) 7)
; (remainder (* 2 (fast-expt 2 16)) 7)
; (remainder (* 2 (square (fast-expt 2 8))) 7)
; (remainder (* 2 (square (square (fast-expt 2 4)))) 7)
; (remainder (* 2 (square (square (square (fast-expt 2 2))))) 7)
; (remainder (* 2 (square (square (square (square (fast-expt 2 1)))))) 7)
; (remainder (* 2 (square (square (square (square (* 2 (fast-expt 2 0))))))) 7)
; (remainder (* 2 (square (square (square (square (* 2 1)))))) 7)
; (remainder (* 2 (square (square (square (square 2))))) 7)
; (remainder (* 2 (square (square (square 4)))) 7)
; (remainder (* 2 (square (square 16))) 7)
; (remainder (* 2 (square 256)) 7)
; (remainder (* 2 65536) 7)
; (remainder 131072 7)
; ; oh ; complex remainder calculation

; original (expmod 2 17 7)
; (remainder (* 2 (expmod 2 16 7)) 7)
; (remainder (* 2 (remainder (square (expmod 2 8 7)) 7)) 7)
; (remainder (* 2 (remainder (square (remainder (square (expmod 2 4 7)) 7)) 7)) 7)
; (remainder (* 2 (remainder (square (remainder (square (remainder (square (expmod 2 2 7)) 7)) 7)) 7)) 7)
; (remainder (* 2 (remainder (square (remainder (square (remainder (square (remainder (square (expmod 2 1 7)) 7)) 7)) 7)) 7)) 7)
; (remainder (* 2 (remainder (square (remainder (square (remainder (square (remainder (square (remainder (* 2 (expmod 2 0 7)) 7)) 7)) 7)) 7)) 7)) 7)
; (remainder (* 2 (remainder (square (remainder (square (remainder (square (remainder (square (remainder (* 2 1) 7)) 7)) 7)) 7)) 7)) 7)
; (remainder (* 2 (remainder (square (remainder (square (remainder (square (remainder (square (remainder 2 7)) 7)) 7)) 7)) 7)) 7)
; (remainder (* 2 (remainder (square (remainder (square (remainder (square (remainder (square 2) 7)) 7)) 7)) 7)) 7)
; (remainder (* 2 (remainder (square (remainder (square (remainder (square (remainder 4 7)) 7)) 7)) 7)) 7)
; (remainder (* 2 (remainder (square (remainder (square (remainder (square 4) 7)) 7)) 7)) 7)
; (remainder (* 2 (remainder (square (remainder (square (remainder 16 7)) 7)) 7)) 7)
; (remainder (* 2 (remainder (square (remainder (square 2) 7)) 7)) 7)
; (remainder (* 2 (remainder (square (remainder 4 7)) 7)) 7)
; (remainder (* 2 (remainder (square 4) 7)) 7)
; (remainder (* 2 (remainder 16 7)) 7)
; (remainder (* 2 2) 7)
; (remainder 4 7)
; 4
; if you note, here calculations are much simplier
