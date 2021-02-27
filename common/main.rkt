#lang at-exp racket

(provide episode
	 assets
	 intro
	 henny-penny-font
	 avatar
	 (all-from-out "./nouns/main.rkt"))

(require editing
	 racket/runtime-path
	 "./nouns/main.rkt")

(define-runtime-path assets "assets")

(define henny-penny-font (build-path assets "henny-penny.ttf"))

(define standing-1 (file-source
		     #:args "-loop 1"
		     (build-path assets "standing-1.png")))

(define standing-2 (file-source
		     #:args "-loop 1"
		     (build-path assets "standing-2.png")))

(define standing-3 (file-source
		     #:args "-loop 1"
		     (build-path assets "standing-3.png")))

(define standing-4 (file-source
		     #:args "-loop 1"
		     (build-path assets "standing-4.png")))

(define avatar-head 
  (file-source
    #:args "-loop 1"
    (build-path assets "Parts/head.png")))

(define avatar-heart
  (file-source
    #:args "-loop 1"
    (build-path assets "Parts/heart.png")))

(define avatar-cloak
  (file-source
    #:args "-loop 1"
    (build-path assets "Parts/cloak.png")))

(define avatar-left-foot
  (file-source
    #:args "-loop 1"
    (build-path assets "Parts/left-foot.png")))

(define avatar-right-foot
  (file-source
    #:args "-loop 1"
    (build-path assets "Parts/right-foot.png")))

(define avatar-left-knee
  (file-source
    #:args "-loop 1"
    (build-path assets "Parts/left-knee.png")))

(define avatar-right-knee
  (file-source
    #:args "-loop 1"
    (build-path assets "Parts/right-knee.png")))

(define avatar-left-shoulder
  (file-source
    #:args "-loop 1"
    (build-path assets "Parts/left-shoulder.png")))

(define avatar-right-shoulder
  (file-source
    #:args "-loop 1"
    (build-path assets "Parts/right-shoulder.png")))

(define avatar-left-hand
  (file-source
    #:args "-loop 1"
    (build-path assets "Parts/left-hand.png")))

(define avatar-right-hand
  (file-source
    #:args "-loop 1"
    (build-path assets "Parts/right-hand.png")))


(define intro (file-source 
		(build-path assets 
			    "intro.mp4"
			    )))

(define (paper)
  (trim 
    #:duration 10
    (overlay
      (scale
	#:w (current-width) #:h (current-height)
	(file-source 
	  #:args "-loop 1"
	  (build-path assets "scroll.png")))
      (blank #:w (current-width) #:h (current-height)
	     #:color "0x000000"))))

(define (episode main-content
		 voice-over
                 #:duration [d 60])

  (new-concat 
    #:n 2
    #:v 1
    #:a 1
    (setsar (scale/pad #:w (current-width) #:h (current-height)
		       
		       (overlay 
			; #:all-expr "A*(if(gte(T,10),1,T/10))+B*(1-(if(gte(T,10),1,T/10)))"

			 (trim #:duration 6 intro)
			 (trim #:duration 6 (paper))
				)
		       ))
    (volume intro)
    (trim
      #:duration d
      (setsar
	(overlay
	  #:x 50
	  #:y "main_h-overlay_h"
	  (avatar
	    #:to-each
	    (lambda (p name)
	      (match name
		     
		     ['left-hand
		      (overlay
			#:x "'if(lte(t,0),(W-w)/2,if(between(mod(t,2),0,0),x+((random(1)*50)*if(gte(x,(W-w)/2),-1,1)),x))'"
			#:y "(H-h)/2" 
			(hue #:h "t*5" p)
			(blank #:w 400 #:h 400))
		      ]
		     ['right-hand 
		      (overlay
			#:x "'if(lte(t,0),(W-w)/2,if(between(mod(t,3),0,0),x+((random(2)*50)*if(gte(x,(W-w)/2),-1,1)),x))'"
			#:y "(H-h)/2"
			(hue #:h "t*5" p)
			(blank #:w 800 #:h 800))
		      ]
		     [else 
		       (hue
			 #:h "t*5"
			 (rotate #:rotate "sin(t)/10" p))
		       ])

	      
	      ))

	  (overlay
	    #:x "(main_w-overlay_w)/2"
	    #:y "(main_h-overlay_h)/2"
	    (scale #:w (* (current-width) 0.7) #:h (* (current-height) 0.7) 
		   main-content)
	    (scale #:w (current-width) #:h (current-height) 
		   (paper))))))
    (atrim #:duration d voice-over)
    ))


(define (avatar #:to-each [to-each (lambda (part name) part)])
  (define y-adj -300)
  (define x-adj 0)
  (scale/pad
    #:w 400 
    #:h 400
    (overlay
      #:x @~a{(main_w-overlay_w)/2-200+@|x-adj|}
      #:y @~a{(main_h-overlay_h)/2+900+@|y-adj|}
      (to-each avatar-left-foot 'left-foot)
      (overlay
	#:x @~a{(main_w-overlay_w)/2+200+@|x-adj|}
	#:y @~a{(main_h-overlay_h)/2+920+@|y-adj|}
	(to-each avatar-right-foot 'right-foot)
	(overlay
	  #:x @~a{(main_w-overlay_w)/2+130+@|x-adj|}
	  #:y @~a{(main_h-overlay_h)/2+600+@|y-adj|}
	  (to-each avatar-right-knee 'right-knee)
	  (overlay
	    #:x @~a{(main_w-overlay_w)/2-130+@|x-adj|}
	    #:y @~a{(main_h-overlay_h)/2+600+@|y-adj|}
	    (to-each avatar-left-knee 'left-knee)
	    (overlay
	      #:x @~a{(main_w-overlay_w)/2-240+@|x-adj|}
	      #:y @~a{(main_h-overlay_h)/2+380+@|y-adj|}
	      (to-each avatar-left-hand 'left-hand)
	      (overlay
		#:x @~a{(main_w-overlay_w)/2+210+@|x-adj|}
		#:y @~a{(main_h-overlay_h)/2+400+@|y-adj|}
		(to-each avatar-right-hand 'right-hand)
		(overlay
		  #:x @~a{(main_w-overlay_w)/2+210+@|x-adj|}
		  #:y @~a{(main_h-overlay_h)/2+100+@|y-adj|}
		  (to-each avatar-right-shoulder 'right-elbow)
		  (overlay
		    #:x @~a{(main_w-overlay_w)/2-240+@|x-adj|}
		    #:y @~a{(main_h-overlay_h)/2+100+@|y-adj|}
		    (to-each avatar-left-shoulder 'left-elbow)
		    (overlay
		      #:x @~a{(main_w-overlay_w)/2+@|x-adj|}
		      #:y @~a{(main_h-overlay_h)/2-260+@|y-adj|}
		      (to-each avatar-head 'head)
		      (overlay
			#:x @~a{(main_w-overlay_w)/2+@|x-adj|}
			#:y @~a{(main_h-overlay_h)/2+@|y-adj|}
			(to-each avatar-heart 'heart)
			(overlay
			  #:x @~a{(main_w-overlay_w)/2+@|x-adj|}
			  #:y @~a{(main_h-overlay_h)/2+220+@|y-adj|}
			  avatar-cloak
			  (blank #:w 1500 #:h 1500
				 #:color "0x00000000"))
			))))))))))))

(module+ main


	 (define (rotating part)
	   (rotate
	     #:rotate "t/10"
	     part))

	 (define rotating-heart
	   (rotating avatar-heart))

	 (define rotating-head
	   (rotating avatar-head))

	 (define bg
	   (overlay
	     #:x "(main_w-overlay_w)/2"
	     #:y "(main_h-overlay_h)/2"
	     (scale/pad
	       #:w 200 
	       #:h 200 
	       standing-1)
	     (paper)))

	 (when (file-exists? "test.mp4")
	   (delete-file "test.mp4"))

	 (new-render
	   #:to "test.mp4"

	   (trim
	     #:duration 4


	     (overlay
	       #:x "(main_w-overlay_w)/2-100"
	       #:y "(main_h-overlay_h)/2-40"
	       (avatar
		 #:to-each
		 (lambda (p)
		   (hue 
		     #:h "t*100"
		     (rotate #:rotate "sin(t)/10" p)))
		 )
	       bg)

	     )))

