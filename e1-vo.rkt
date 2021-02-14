#lang at-exp racket

(require editing
	 editing/aws-transcription/main
	 "./lib.rkt")

(working-directory "workspace")

(define (t . s)
  (text (trim #:duration 10
	      (blank #:w 640 #:h 480))
	#:text (string-join s "")))

(define (img i)
  (trim #:duration 60 ;Will get further clipped, 
	(file-source #:args "-loop 1"
		     i)))
	 
(define slides
  (list
    (list "in" #|the summer of the year 2000, a fleet of 100|# 
	  @t{In the summer of the year 2000,
	  a fleet of 1000})
    (list "airplanes" #|and 9000|# 
	  @img{plane.png})
    (list "trucks" #|were dispatched. Their mission? To arrive by midnight on July 8th carrying a quarter of a million|# 
	  @img{trucks.png})
    (list "what" 
	  @t{what})))

(define words-to-keep
  (apply keep-words (json-file->transcribed-words "e1-vo.json") 
	 (map first slides)))

(render
  #:to "output.mp4"
  (trim
    #:duration 20

    (apply (curry slideshow #:end 20)
	   (flatten
	     (map 
	       (lambda (tw i)
		 (list 
		   (transcribed-word-end-time tw)
		   (second (list-ref slides i)))) 

	       words-to-keep
	       (range (length words-to-keep))))))

  (atrim
    #:duration 20
    (volume
      #:volume 1
      (file-source
	"e1-vo.mp4"))))

(system "xdg-open workspace/output.mp4")
