#lang racket
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     CS 381 - Programming Lab #4		;
;										;
;  Casey Colley					 	;
;  colleyc@oregonstate.edu	                	;
;										;
;  docker run --rm -it -v "$(pwd):/script" racket/racket:8.7-full racket /script/lab4.rkt
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (member? e lst)
  (if (null? lst)
    #f
    (or 
      (equal? (car lst) e)
      (member? e (cdr lst))
    )
  )
)


(define (set? lst) 
  (if (null? lst)
    #t
    (and
      (not (member? (car lst) (cdr lst)))
      (set? (cdr lst))
    )
  )
)


(define (union lst1 lst2)
  (if (null? lst1)
    (if (null? lst2)
      (car (cons empty empty))
      (if (set? (cons (car lst2) (union empty (cdr lst2))))
        (cons (car lst2) (union empty (cdr lst2)))
        (car (cons (union empty (cdr lst2)) empty))
      )
    )
    (if (set? (cons (car lst1) (union (cdr lst1) lst2)))
      (cons (car lst1) (union (cdr lst1) lst2))
      (car (cons (union (cdr lst1) lst2) empty))
    )
  )
)


(define (intersect lst1 lst2)
  (if (null? (cdr lst1))
    (if (set? (cons (car lst1) lst2))
      (car (cons empty empty))
      (cons (car lst1) empty)
    )
    (if (set? (cons (car lst1) lst2))
      (car (cons (intersect (cdr lst1) lst2) empty))
      (cons (car lst1) (intersect (cdr lst1) lst2))
    )
  )
)


(define (difference lst1 lst2)
  (if (null? (cdr lst1))
    (if (set? (cons (car lst1) lst2))
      (cons (car lst1) empty)
      (car (cons empty empty))
    )
    (if (set? (cons (car lst1) lst2))
      (cons (car lst1) (difference (cdr lst1) lst2))
      (car (cons (difference (cdr lst1) lst2) empty))
    )
  )
)


;;;;;;;;;;;;;;;;;
;  DO NOT EDIT  ;
;;;;;;;;;;;;;;;;;
; enables testing via piping in stdin
(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))
(let loop ()
  (define line (read-line (current-input-port) 'any))
  (if (eof-object? line)
    (display "")
    (begin (print (eval (read (open-input-string line)) ns)) (newline) (loop))))