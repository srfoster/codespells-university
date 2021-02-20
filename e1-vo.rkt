#lang at-exp racket

;TODO:
; * Make intro audio work
; * Make render and -mapping work better
; * Finish rest of main content
;   - Make json transcript easier to work with

(require editing
	 editing/aws-transcription/main
	 "./lib.rkt"
	 "./common/main.rkt"
	 )

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
	  @img{mystery-box.png})
    (list "a" 
	  @img{guns.png})
    (list "b" 
	  @img{refugees.png})
    (list "c" 
	  @img{gandalfs.png})
    (list "d" 
	  @img{books.png})
    (list "c" 
	  @img{gandalfs.png})
    (list "d" 
	  @img{books.png})
    (list "harry" 
	  @img{harry-potter-cover.png})
    (list "fire" 
	  @img{harry-potter-cover.png})
    ))

(define words-to-keep
  (apply keep-words (json-file->transcribed-words "e1-vo.json") 
	 (map first slides)))


(define all-slides
  (apply (curry slideshow #:end 20)
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
    (file-source "e1-vo.mp4")))

(define main
  (episode content voice-over))

;(debug? #t)
(new-render
  #:to "output.mp4"
  #:show? #f
  main)

#;
(system "xdg-open workspace/output.mp4")
