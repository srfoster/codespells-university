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
	  @img{buffy.png})

    (list "spirits" 
	  @img{seance.png})

    (list "force" 
	  @img{yoda.png})

    (list "midichloreans" 
	  @img{anikan.png})
   
    (list "word" 
	  @img{magic-wordcloud.png})

    (list "across" 
	  @img{world.png})

    (list "generations" 
	  @img{wizards.png})

    (list "1692" 
	  @img{witch-trial.png})

    (list "accused" 
	  @img{monty-python1.png})
   
    (list "30" 
	  @img{monty-python2.png})

    (list "guilty" 
	  @img{guilty.png})
   
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
   
    (list "crystals" 
	  @img{crystals.png})

    (list "mounting" 
	  @img{science-meme.png})
   
    (list "hardwired" 
	  @img{brain-magic.png})

    (list "wait" 
	  @img{gollum.png})
   
    (list "question" 
	  @img{test-taker.png})

    (list "cockroaches" 
	  @img{cockroaches.png})

    (list "photograph" 
	  @img{family-photo.png})

    (list "Question" 
	  @img{test-taker2.png})
   
    (list "rather" 
	  @img{sleepover.png})

    (list "luxurious" 
	  @img{big-house.png})

    (list "murdered" 
	  @img{caution-tape.png})

    (list "grimy" 
	  @img{bus-station.png})
   
    (list "Question" 
	  @img{test-taker3.png})

    (list "ride" 
	  @img{speeding-car.png})

    (list "yell" 
	  @img{mountains.png})

    (list "question" 
	  @img{test-taker4.png})

    (list "laundered" 
	  @img{pjs.png})

    (list "Charles" 
	  @img{mug-shot.png})

    (list "nickel" 
	  @img{nickel.png})

    (list "think" 
	  @img{two-buttons.png})
   
    (list "stabbing" 
	  @img{family-photo.png})

    (list "staying" 
	  @img{big-house.png})

    (list "gross" 
	  @img{trucks.png})

    (list "say" 
	  @img{no-magic.png})
   
    (list "behind" 
	  @img{no-witches.png})

    (list "irrational" 
	  @img{gut-feelings.png})

    (list "let" 
	  @img{heart-brain-scale.png})

    (list "said" 
	  @img{heart-vs-brain.png})

    (list "growing" 
	  @img{folders.png})

    (list "conservatives" 
	  @img{maga-hat.png})

    (list "liberals" 
	  @img{bernie.png})

    (list "red" 
	  @img{donkey-elephant.png})
   
    (list "antivaxxers" 
	  @img{anti-vaxxers.png})

    (list "scientists" 
	  @img{fauci.png})

    (list "conspiracy" 
	  @img{info-wars.png})

    (list "skeptics" 
	  @img{magnifying-glass.png})
   
    (list "explained" 
	  @img{scales.png})

    (list "grounds" 
	  @img{may-we-burn-her.png})

    (list "codespells" 
	  @img{code-spells.png})

    (list "powerful" 
	  @img{potter-musical.png})

    (list "good" 
	  @img{patronus.png})

    (list "real" 
	  @img{gravity.png})

    (list "next" 
	  @img{trucks.png})

    (list "evolutionary" 
	  @img{evolution.png})

    (list "goal" 
	  @img{trucks.png})

    (list "reality" 
	  @img{witchcraft.png})

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
    #:duration 220
    content voice-over))

;(debug? #t)
(new-render
  #:to "output.mp4"
  #:show? #t

  main

  #;
  (trim #:duration 40 main)
)


