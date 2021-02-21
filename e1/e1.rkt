#lang at-exp racket

;TODO:
; * Finish rest of main content
;   - Make json transcript easier to work with

(require editing
	 editing/aws-transcription/main
	 "../common/lib.rkt"
	 "../common/main.rkt"
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
    (list "500" 
	  @img{trucks.png})

    (list "Magic" 
	  @img{plane.png})

    (list "Lord" 
	  @img{trucks.png})

    (list "magic" 
	  @img{plane.png})

    (list "genetic" 
	  @img{trucks.png})

    (list "advanced" 
	  @img{plane.png})

    (list "connection" 
	  @img{trucks.png})

    (list "spirits" 
	  @img{plane.png})

    (list "force" 
	  @img{trucks.png})

    (list "midichloreans" 
	  @img{plane.png})
   
    (list "word" 
	  @img{plane.png})

    (list "across" 
	  @img{trucks.png})

    (list "generations" 
	  @img{plane.png})

    (list "1692" 
	  @img{trucks.png})

    (list "accused" 
	  @img{plane.png})
   
    (list "30" 
	  @img{trucks.png})

    (list "guilty" 
	  @img{plane.png})
   
    (list "executed" 
	  @img{trucks.png})

    (list "YouTube" 
	  @img{plane.png})
   
    (list "self" 
	  @img{trucks.png})

    (list "coronavirus" 
	  @img{plane.png})

    (list "computer" 
	  @img{trucks.png})
   
    (list "true" 
	  @img{plane.png})

    (list "antiquated" 
	  @img{plane.png})
   
    (list "children" 
	  @img{trucks.png})

    (list "primitive" 
	  @img{plane.png})
   
    (list "crystals" 
	  @img{trucks.png})

    (list "mounting" 
	  @img{plane.png})
   
    (list "hardwired" 
	  @img{trucks.png})

    (list "wait" 
	  @img{plane.png})
   
    (list "question" 
	  @img{trucks.png})

    (list "cockroaches" 
	  @img{plane.png})

    (list "photograph" 
	  @img{trucks.png})

    (list "Question" 
	  @img{plane.png})
   
    (list "rather" 
	  @img{trucks.png})

    (list "luxurious" 
	  @img{plane.png})

    (list "murdered" 
	  @img{trucks.png})

    (list "grimy" 
	  @img{plane.png})
   
    (list "Question" 
	  @img{trucks.png})

    (list "ride" 
	  @img{plane.png})

    (list "yell" 
	  @img{trucks.png})

    (list "question" 
	  @img{plane.png})

    (list "laundered" 
	  @img{trucks.png})

    (list "Charles" 
	  @img{plane.png})

    (list "nickel" 
	  @img{trucks.png})

    (list "think" 
	  @img{plane.png})
   
    (list "stabbing" 
	  @img{trucks.png})

    (list "staying" 
	  @img{plane.png})

    (list "gross" 
	  @img{trucks.png})

    (list "say" 
	  @img{plane.png})
   
    (list "behind" 
	  @img{trucks.png})

    (list "irrational" 
	  @img{plane.png})

    (list "let" 
	  @img{trucks.png})

    (list "said" 
	  @img{plane.png})

    (list "growing" 
	  @img{trucks.png})

    (list "conservatives" 
	  @img{plane.png})

    (list "liberals" 
	  @img{trucks.png})

    (list "red" 
	  @img{plane.png})
   
    (list "antivaxxers" 
	  @img{trucks.png})

    (list "scientists" 
	  @img{plane.png})

    (list "conspiracy" 
	  @img{trucks.png})

    (list "skeptics" 
	  @img{plane.png})
   
    (list "explained" 
	  @img{trucks.png})

    (list "grounds" 
	  @img{plane.png})

    (list "codespells" 
	  @img{trucks.png})

    (list "powerful" 
	  @img{plane.png})

    (list "good" 
	  @img{trucks.png})

    (list "real" 
	  @img{plane.png})

    (list "next" 
	  @img{trucks.png})

    (list "evolutionary" 
	  @img{plane.png})

    (list "goal" 
	  @img{trucks.png})

    (list "reality" 
	  @img{plane.png})

	 ))

(define words-to-keep
  (apply keep-words (json-file->transcribed-words "e1-vo.json") 
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
    (file-source "e1-vo.mp4")))

(define main
  (episode 
    #:duration 200
    content voice-over))

;(debug? #t)
(new-render
  #:to "output.mp4"
  #:show? #t

  main

  #;
  (trim #:duration 40 main)
)


