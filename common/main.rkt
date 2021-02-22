#lang racket

(provide episode
	 assets
	 intro)

(require editing
	 racket/runtime-path)

(define-runtime-path assets "assets")

(define standing-1 (file-source
		     #:args "-loop 1"
		     (build-path assets "standing-1.png")))

(define standing-2 (file-source
		     #:args "-loop 1"
		     (build-path assets "standing-2.png")))

(define intro (file-source (build-path assets "intro.mkv")))

(define paper 
  (trim 
    #:duration 10
    (file-source 
	  #:args "-loop 1"
	  (build-path assets "paper.jpg"))))


(define (episode main-content
		 voice-over
                 #:duration [d 60])

  (new-concat 
    #:n 2
    #:v 1
    #:a 1
    (setsar (scale/pad #:w 640 #:h 480 
		       (trim #:duration 5 intro)))
    (volume intro)
    (trim
      #:duration d
      (setsar
	(overlay
	  #:x -30
	  #:y "main_h-150"
	  (scale #:w 120 #:h 200 standing-2)
	  (overlay
	    #:x "main_w-overlay_w-10"
	    #:y 10
	    (scale #:w (* 640 0.9) #:h (* 480 0.9) 
		   main-content)
	    (scale #:w 640 #:h 480 paper)))))
    (atrim #:duration d voice-over)
    ))
