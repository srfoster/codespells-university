#lang at-exp racket

;TODO:
; * Refactor this file.  Only the words and beats...
; * Decide on paper pg, scroll or not
; * Fancy mascot animations...

(require editing
	 editing/aws-transcription/main
	 "../common/lib.rkt"
	 "../common/main.rkt"
	 (prefix-in i: 2htdp/image))

(working-directory "workspace")
(current-width  1920)
(current-height 1080)

(define (t . s)
  (text (trim #:duration 10
	      (blank #:w (current-width) #:h (current-height)
		     #:color "0x00000000"
		     ))
	#:fontcolor "black"
	#:fontsize 100
	#:fontfile henny-penny-font
	#:text (string-join s "")))


(define (img i)
  (trim #:duration 60 ;Will get further clipped, 
	(file-source #:args "-loop 1"
		     i)))

(define slides
  (list
    (list "in" #|the summer of the year 2000, a fleet of 100|# 
	  @t{Summer 2000})

    (list "airplanes" 
	  @img{plane.png})
    (list "trucks" 
	  @img{trucks.png})
    (list "mission" 
	  @t{Mission?})
    (list "what" 
	  (image-source 
	    (i:beside mystery-box mystery-box mystery-box )))
    (list "a" 
	  @t{A})
    (list "quarter" 
	  @img{guns.png})
    (list "b" 
	  @t{B})
    (list "quarter" 
	  @img{refugees.png})
    (list "c" 
	  @t{C})
    (list "quarter" 
	  @img{gandalfs.png})
    (list "d" 
	  @t{D})
    (list "quarter" 
	  @img{books.png})
    (list "c" 
	  @img{gandalfs.png})
    (list "d" 
	  @img{books.png})
    (list "harry" 
	  @img{harry-potter-cover.png})

    (list "just" 
	  @t{0.05%})

    (list "500" 
	  @img{bookstore.jpg})

    (list "Magic" 
	  @img{harry-potter-spell.png})

    (list "Lord" 
	  @img{gandalf-spell.png})

    (list "magic" 
	  @img{magneto.png})

    (list "genetic" 
	  @img{dna.png})

    (list "advanced" 
	  @img{iron-man.png})

    (list "connection" 
	  @img{willow.jpg})

    (list "spirits" 
	  @img{seance.png})

    (list "force" 
	  @img{yoda.png})

    (list "midichloreans" 
	  (image-source
	    (i:above 
	      (i:bitmap "workspace/anikan.png") 
	      (i:text "Midi-chlorians?" 40 'black)))) 
   
    (list "word" 
	  @img{magic-wordcloud.png})

    (list "across" 
	  (image-source 
	    world))

    (list "cultures" 
	  (image-source
	    (i:beside 
	      world
	      group
	      )))

    (list "generations" 
	  (image-source
	    (i:beside 
	      world
	      group
	      generations
	      )))

    (list "1692" 
	  @img{witch-trial.png})

    #;
    (list "accused" 
	  @img{monty-python1.png})
   
    (list "accused" 
	  (image-source
	    (i:bitmap/file "workspace/monty-python2.png")))

    (list "guilty" 
	  (image-source
	    (i:overlay
	      (i:bitmap/file "workspace/guilty.png")
	      (i:bitmap/file "workspace/monty-python2.png"))))
   
    (list "executed" 
	  @img{hangings.png})

    (list "YouTube" 
	  @img{youtube.png})
   
    (list "self" 
	  @img{fancy-car.png})

    (list "coronavirus" 
	  @img{vaccines.png})

    (list "computer" 
	  @img{codespells-2.png})
   
    (list "true" 
	  @img{true-belief.png})

    (list "antiquated" 
	  @img{horse-and-buggy.png})
   
    (list "children" 
	  @img{magic-show.png})

    (list "primitive" 
	  @img{early-human.png})
   
    (list "weird" 
	  @img{crystals.png})

    (list "mounting" 
	  @img{enchanted-america.jpg})
   
    (list "one" 
	  (image-source
	    brain))

    (list "hardwired" 
	  (image-source
	    (i:beside brain
		      evolution)))

    (list "wait" 
	  @img{gollum.png})
   
    (list "question" 
	  @t{Question 1})

    (list "cockroaches" 
	  @img{cockroaches.webp})

    (list "photograph" 
	  @img{family-photo.png})

    (list "Question" 
	  @t{Question 2})
   
    (list "rather" 
	  @img{sleepover.png})

    (list "luxurious" 
	  @img{big-house.png})

    (list "murdered" 
	  (image-source
	    (i:overlay
	      (i:bitmap/file "workspace/caution-tape.png")
	      (i:bitmap/file "workspace/big-house.png")
	      )))

    (list "grimy" 
	  @img{bus-station.png})
   
    (list "Question" 
	  @t{Question 3})

    (list "ride" 
	  @img{speeding-car.png})

    (list "yell" 
	  @img{mountains.png})

    (list "question" 
	  @t{Question 4})

    (list "laundered" 
	  @img{pajamas.jpg})

    (list "Charles" 
	  @img{mug-shot.png})

    (list "nickel" 
	  @img{nickel.png})

    (list "think" 
	  @img{two-buttons.png})
   
    (list "stabbing" 
	  @img{family-photo.png})

    (list "staying" 
	  (image-source
	    (i:overlay
	      (i:bitmap/file "workspace/caution-tape.png")
	      (i:bitmap/file "workspace/big-house.png")
	      )))

    (list "gross" 
	  @t{gross})

    (list "say" 
	  @img{no-magic.png})

    (list "magical"
	  (image-source
	    witch))
   
    (list "behind" 
	  (image-source
	    (i:overlay banned witch)))

    (list "irrational" 
	  (image-source guts))

    (list "let" 
	  (image-source
	    (i:beside guts brain)))

    (list "said" 
	  (image-source
	    (i:beside guts 
		      (i:scale 2 scales) 
		      brain)))

    (list "growing" 
	  @img{folders.png})

    (list "conservatives" 
	  @img{maga-hat.png})

    (list "liberals" 
	  @img{bernie.png})

    (list "red" 
	  (image-source
	    (i:bitmap/file "workspace/donkey-elephant.png")))

    (list "blue" 
	  (image-source
	    (i:flip-horizontal
	      (i:bitmap/file "workspace/donkey-elephant.png"))))
   
    (list "antivaxxers" 
	  @img{anti-vaxxers.png})

    (list "scientists" 
	  @img{fauci.png})

    (list "conspiracy" 
	  @img{info-wars.png})

    (list "skeptics" 
	  @img{magnifying-glass.png})
   
    (list "explained" 
	  (image-source scales))

    (list "grounds" 
	  @img{may-we-burn-her.png})

    (list "codespells" 
	  @img{code-spells.png})

    (list "powerful" 
	  @img{potter-musical.png})

    (list "good" 
	  @img{patronus.png})

    (list "real" 
	  @img{god-adam.jpg})

    (list "evolutionary" 
	  (image-source
	    evolution-2))

    (list "ultimate" 
	  (image-source
	    (i:overlay banned witch)))

    (list "real" 
	  (image-source witch))

    (list "reality" 
	  @img{earth.jpg})

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
    (file-source "e1-vo.mp3")))

(define main
  (episode 
    #:duration 220
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

