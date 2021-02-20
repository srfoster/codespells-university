#lang at-exp racket

(require editing
	 editing/aws-transcription/main
	 "../lib.rkt")

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
    (list "child" 
	  @img{baby.png})
    (list "interesting" 
	  @img{baby.png})
    ))

(define words-to-keep
  (apply keep-words (json-file->transcribed-words "e2-vo.json") 
	 (map first slides)))

(render
  #:to "output.mp4"
  (trim
    #:duration 40

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
    #:duration 40
    (volume
      #:volume 1
      (file-source
	"e2-vo.mp3"))))

(system "xdg-open workspace/output.mp4")
