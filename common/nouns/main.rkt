#lang racket

(require editing
	 racket/runtime-path
	 (only-in 2htdp/image bitmap/file))

(define-runtime-path assets ".")

(define-syntax-rule 
  (define/provide-asset name)
  (begin
    (provide name)
    (define name
      (bitmap/file (build-path assets (~a 'name ".png"))))))

(define/provide-asset mystery-box)
(define/provide-asset world)
(define/provide-asset group)
(define/provide-asset generations)
(define/provide-asset brain)
(define/provide-asset evolution)
(define/provide-asset evolution-2)
(define/provide-asset scales)
(define/provide-asset banned)
(define/provide-asset witch)
(define/provide-asset guts)
(define/provide-asset magic)

