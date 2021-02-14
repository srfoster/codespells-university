#lang at-exp racket

(require editing/lang
	 "./lib.rkt")

(working-directory "workspace")

(define sources 
  (map 
    (lambda (i)
      (define post-fix 
	(if (= 0 i)
	    ""
	    (~a " (" i ")")))

      (file-source @~a{"pasted image 0@|post-fix|.png"})) 
    (range 0 100)))

(define (s i)
  (list-ref sources i))

(slideshow
   0 (s 0) ;Airplane
   1 (s 1) ;Trucks
   2 (s 2) ;Secret box
   3 (s 3) ;Weapons
   4 (s 4) ;Refugees
   5 (s 5) ;Gandalfs
   6 (s 6) ;Books
   7 (s 5) ;+ (s 6), Books and Gandalfs
   8 (s 7) ;Harry potter
   9 (s 7) ;Harry potter x infinity
   10 (s 8) ;Harry potter spell
   11 (s 9) ;Gandalf spell
   12 (s 10) ;DNA
   13 (s 11) ;Avengers
   14 (s 12) ;Iron man 1
   15 (s 13) ;Iron man 2

   16 (s 14) ;Buffy
   17 (s 15) ;Seance
   18 (s 16) ;Yoda
   19 (s 17) ;Anikan
   20 (s 18) ;World
   21 (s 19) ;Wizard convention

   22 (s 20) ;Witch
   23 (s 21) ;Monty python
   24 (s 22) ;Monty python 2
   25 (s 23) ;Guilty
   26 (s 24) ;Hanging
   27 (s 25) ;Youtube
   28 (s 26) ;Fancy car
   29 (s 27) ;Vaccine
   30 (s 28) ;Codespells

   31 (s 29) 

   32 (s 30) 
   33 (s 31) 
   34 (s 32) 
   35 (s 33) 
   36 (s 34) 

   37 (s 35) 
   38 (s 36) 
   39 (s 37) 
   40 (s 38) 
   41 (s 39) 


   42 (s 40) 
   43 (s 41) 
   44 (s 42) 
   45 (s 43) 
   46 (s 44) 

   47 (s 45) 
   48 (s 46) 
   49 (s 47) 
   50 (s 48) 
   51 (s 49) 


   52 (s 50) 
   53 (s 51) 
   54 (s 52) 
   55 (s 53) 
   56 (s 54) 

   57 (s 55) 
   58 (s 56) 
   59 (s 57) 
   60 (s 58) 
   61 (s 59) 



   62 (s 60) 
   63 (s 61) 
   64 (s 62) 
   65 (s 63) 
   66 (s 64) 

   67 (s 65) 
   68 (s 66) 
   69 (s 67) 
   70 (s 68) 
   71 (s 69) 

   72 (s 70) 
   73 (s 71) 
   74 (s 72) 
   75 (s 73) 
   76 (s 74) 

   77 (s 75) 
   78 (s 76) 
   79 (s 77) 
   80 (s 78) 
   81 (s 79) 

   82 (s 80) 

   #:end 85)




