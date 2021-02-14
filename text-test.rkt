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

(define (text i
	      #:text t)
  (filt 
    (list i)
    @~a{drawtext=text='@t':fontcolor=white:fontsize=24:x=(w-text_w)/2:y=(h-text_h)/2}))

(define (t i)
  (define paras
    (list
      @~a{In summer of the year 2000\n, 
      a fleet of 100 airplanes and 9,000 
      thousand trucks were dispatched.  
      Their mission?  To arrive by midnight 
      on July 8, carrying a quarter of a 
      million what...}

      @~a{Was it A, a quarter of a million 
      military grade weapons}

      @~a{B, A quarter of a million climate 
      refugees,} 

      @~a{C, A quarter of a million wizards,}

      @~a{or D, A quarter of a million magic 
      books.}

      @~a{Did you answer C or D?}

      @~a{It was quarter of a million copies of 
      Harry Potter and the Goblet of Fire.}

      @~a{But a quarter of a million?  That’s just 
      0.05 percent of the 500 million copies of 
      Harry Potter sold.}

      @~a{
      Needless to say, magic is gripping, from 
      works with explicit magic like Harry Potter 
      and Lord of the Rings -- 
      } 
      @~a{
      to ones with “wizards” whose “magic” comes 
      from their genetic mutations, 
      } 
      @~a{
      their advanced technology,
      } 
      @~a{
      connection to deities and spirits
      } 
      @~a{
      or their “force powers” 
      } 
      @~a{
      (which maybe come from their midi-chlorians?).
      } 
      @~a{
      Whatever word you use, magic enchants us 
      across national borders, across cultures, 
      across generations.
      } 
      @~a{
      In 1692 the belief in magic that 
      enchanted Salem Massachusetts was so strong 
      that two hundred people would be accused of 
      being witches.
      } 
      @~a{
      Thirty would be found guilty. 
      } 
      @~a{
      And nineteen would be executed.
      } 
      @~a{
      From our vantage point in the age of Youtube, 
      and self-driving cars, coronavirus vaccines, 
      and computer games, 
      } 
      @~a{
      it may seem like belief in true magic is an 
      antiquated concept --
      } 
      @~a{
      something only found in children, primitive 
      cultures, or your weird aunt with all the crystals.  
      } 
      @~a{
      But mounting research shows otherwise.
      } 
      @~a{
      In fact, one theory suggests that the belief in 
      magic might be hardwired into our brains by 
      evolution.
      } 
      @~a{wait, wait, wait  you are probably 
      saying, I dont believe in magic, and I 
      dont know anyone who does.  Okay, then, 
      you shouldnt object to taking the following 
      test just to be sure
      } 
      @~a{
      Question 1.  Would you rather ...
      } 
      @~a{
      a, stick your hands in a bowl of cockroaches?
      } 
      @~a{
      b, stab a photograph of your family six times?
      } 
      @~a{
      Question 2.  
      } 
      @~a{
      Would you rather spend the night in 
      } 
      @~a{
      a, a luxurious house where a family had recently 
      been murdered?
      } 
      @~a{
      b, a grimy bus station?
      } 
      @~a{
      Question 3. Would you rather ...
      } 
      @~a{
      a, ride in a speeding car without a seat belt?
      }
      @~a{
      b, yell “I hope I die tomorrow” 
      six times out loud?
      }
      @~a{
      Question 4. Would you rather ...
      }
      @~a{
      a, sleep in laundered pajamas once worn by 
      Charles Manson?
      }
      @~a{
      b) put a nickel in your mouth that you 
      found on the ground?
      }
      @~a{
      Even we at CodeSpells University had to think 
      twice about some of those questions,
      }
      @~a{
      Stabbing a photo of our families?
      }
      @~a{
      Staying in a house where someone was 
      murdered?
      }
      @~a{
      Gross.
      }
      @~a{
      Although we would say we left our magical 
      beliefs behind in our childhoods,
      }
      @~a{
      the vestiges of it seem to linger in our 
      irrational “gut feelings.”  
      }
      @~a{
      We don’t let those feelings affect our 
      behavior, but we’d be lying if we said 
      they aren’t there. 
      }
      @~a{
      Growing evidence suggests that we’re not 
      alone in this ... 
      }
      @~a{
      that the divide between 
      conservatives and liberals
      }
      @~a{
      red and blue
      }
      @~a{
      antivaxxers and scientists
      }
      @~a{
      conspiracy theorists and skeptics
      }
      @~a{
      can be explained by how much we are 
      or are not enchanted by magical thinking.
      }
      @~a{
      On these grounds, there are those who 
      argue that magical thinking is bad for 
      society.  
      }
      @~a{
      But at CodeSpells University, we’re not 
      so sure. 
      }
      @~a{
      We know from experience how powerful 
      it can be to pretend to be a wizard, 
      }

      @~a{
      or read about good magic vanquishing evil, 
      }
      @~a{
      and even to believe in real cosmic forces 
      that we cannot see.
      }
      @~a{
      In the next episode of this CodeSpells 
      University series, we’ll explore the 
      }
      @~a{
      evolutionary origins of magical thinking 
      and how belief in magic may have helped 
      early humans survive. 
      }
      @~a{
      Our ultimate goal with CodeSpells is to 
      make magic more real; 
      }
      @~a{
      but the reality is, magic is already real 
      for billions of people, and has been for 
      a very long time.
      }
      ))
  (list-ref paras i))

(define ss
  (slideshow
    0  (s 0)
    #;
    (text (blank 20)
	  #:text (t 0)) 
    14  (s 1)

    #;
    (text (blank 20)
	    #:text (t 1)) 


    17  (s 2)
    #;
    (text (blank 20)
	    #:text (t 2)) 
    22 (text (blank 20)
	    #:text (t 3)) 

    24 (text (blank 20)
	    #:text (t 4)) 

    27 (text (blank 20)
	    #:text (t 5)) 
    30 (text (blank 20)
	    #:text (t 6)) 
    34 (text (blank 20)
	    #:text (t 7)) 
    41 (text (blank 20)
	    #:text (t 8)) 
    48 (text (blank 20)
	    #:text (t 9)) 

    51 (text (blank 20)
	     #:text (t 10)) 
    54 (text (blank 20)
	     #:text (t 11)) 
    56 (text (blank 20)
	     #:text (t 12)) 
    58 (text (blank 20)
	     #:text (t 13)) 
    60 (text (blank 20)
	     #:text (t 14)) 
    68 (text (blank 20)
	     #:text (t 15)) 
    75 (text (blank 20)
	     #:text (t 16)) 
    78 (text (blank 20)
	     #:text (t 17)) 
    79 (text (blank 20)
	     #:text (t 18)) 
    87 (text (blank 20)
	     #:text (t 19)) 

    89 (text (blank 20)
	     #:text (t 20)) 
    93 (text (blank 20)
	     #:text (t 21)) 
    98 (text (blank 20)
	     #:text (t 22)) 
    103 (text (blank 20)
	     #:text (t 23)) 
    112 (text (blank 20)
	     #:text (t 24)) 
    114 (text (blank 20)
	     #:text (t 25)) 
    117 (text (blank 20)
	     #:text (t 26)) 
    120 (text (blank 20)
	     #:text (t 27)) 
    121 (text (blank 20)
	     #:text (t 28)) 
    123 (text (blank 20)
	     #:text (t 29)) 

    127 (text (blank 20)
	     #:text (t 30)) 

    129 (text (blank 20)
	     #:text (t 31)) 

    130 (text (blank 20)
	     #:text (t 32)) 

    134 (text (blank 20)
	     #:text (t 33)) 

    138 (text (blank 20)
	     #:text (t 34)) 

    141 (text (blank 20)
	     #:text (t 35)) 
    144 (text (blank 20)
	     #:text (t 36)) 
    147 (text (blank 20)
	     #:text (t 37)) 
    152 (text (blank 20)
	     #:text (t 38)) 
    153 (text (blank 20)
	     #:text (t 39)) 

    155 (text (blank 20)
	     #:text (t 40)) 
    157 (text (blank 20)
	     #:text (t 41)) 
    161 (text (blank 20)
	     #:text (t 42)) 
    164 (text (blank 20)
	     #:text (t 43)) 
    168 (text (blank 20)
	     #:text (t 44)) 
    172 (text (blank 20)
	     #:text (t 45)) 
    174 (text (blank 20)
	     #:text (t 46)) 
    175 (text (blank 20)
	     #:text (t 47)) 
    176 (text (blank 20)
	     #:text (t 48)) 
    178 (text (blank 20)
	     #:text (t 49)) 

    183 (text (blank 20)
	     #:text (t 50)) 
    187 (text (blank 20)
	     #:text (t 51)) 
    190 (text (blank 20)
	     #:text (t 52)) 
    194 (text (blank 20)
	     #:text (t 53)) 
    198 (text (blank 20)
	     #:text (t 54)) 
    201 (text (blank 20)
	     #:text (t 55)) 
    205 (text (blank 20)
	     #:text (t 56)) 
    211 (text (blank 20)
	     #:text (t 57)) 
    213 (text (blank 20)
	     #:text (t 58)) 


    #:end 220))

(render
  #:to "output.mp4"
  ss)

#;
(system "xdg-open workspace/output.mp4")

(define (overlay-audio i1 i2 out)
  (system
    @~a{
    ffmpeg -i workspace/@i1 -i workspace/@i2 -map 1:v -map 0:a -c:v copy -shortest workspace/@out
    }))

(overlay-audio "e1-vo.mp4"
	       "output.mp4"
	       "output-with-audio.mp4"
	       )


(system "xdg-open workspace/output-with-audio.mp4")

