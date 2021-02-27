#lang at-exp racket

(require editing
	 editing/aws-transcription/main
	 "../common/lib.rkt"
	 "../common/main.rkt"
	 )

(working-directory "workspace")
(current-width  1920)
(current-height 1080)

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

(define all-slides
  (apply (curry slideshow #:end 500)
	 (flatten
	   (map 
	     (lambda (tw i)
	       (list 
		 (transcribed-word-end-time tw)
		 (second (list-ref slides i)))) 

	     words-to-keep
	     (range (length words-to-keep))))))

(define content all-slides)

(define voice-over
  (volume 
    (file-source "e2-vo.mp4")))


(define main
  (episode 
    #:duration 5
    content voice-over))

;(text #f #:text "test % ...")
;(debug? #t)
(when (file-exists? "workspace/output.mp4")
  (delete-file "workspace/output.mp4"))

(new-render
  #:to "output.mp4"
  #:show? #t

  main

  #;
  (trim #:duration 40 main)
)
