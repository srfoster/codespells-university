#lang at-exp racket 

(provide slideshow)

(require editing)


#;
(define blank
  (filt (list)
	"nullsrc=size=640x480,trim=start=0:duration=20"))

#;
(define (resize i)
  (overlay
    (filt (list i)
	  @~a{scale=iw*min(600/iw\,400/ih):ih*min(600/iw\,400/ih),pad=600:400:(600-iw*min(600/iw\,400/ih))/2:(400-ih*min(600/iw\,400/ih))/2,setsar=1:1})
    blank))

(define (trim i #:seconds seconds)
  (filt (list i)
	@~a{trim=start=0:end=@seconds,setpts=PTS-STARTPTS}))

(define (moments->lengths moments)
  (define ret '())

  (for ([m (drop-right moments 1)]
	[i (in-naturals)])
       (define l 
	 (- (list-ref moments (add1 i))
	    (list-ref moments i)))
       (set! ret (cons l ret)))

  (reverse ret))

(define (slideshow #:end end
		   . slides+moments)

  (define moments
    (append
      (filter identity
	      (map 
		(lambda (sm i)
		  (if (even? i)
		      sm
		      #f))
		slides+moments 
		(range 0 (length slides+moments))))
      (list end)))

  (define slides
    (filter identity
	    (map 
	      (lambda (sm i)
		(if (odd? i)
		    sm
		    #f))
	      slides+moments 
	      (range 0 (length slides+moments)))))


  (apply concat 
	 (map 
	   (lambda (slide seconds)
	     (trim #:seconds seconds (scale 
				       #:w 640
				       #:h 480
				       slide))) 
	   slides
	   (moments->lengths moments)))
  )
