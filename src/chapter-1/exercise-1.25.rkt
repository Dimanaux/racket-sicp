#lang racket


; Lisa P. Hacker says that expmod does lot of excessive
; work. She suggests this procedure.


(define (expmod base exp m)
    (remainder (fast-expt base exp) m))

; Is she right?


; No. This procedure works with numbers ~ base ^ exp
; while original expmod works with numbers ~ exp

