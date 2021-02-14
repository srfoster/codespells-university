#lang at-exp racket

(require editing/lang "./lib.rkt")
	 
(working-directory "workspace")

(define audio
  (file-source "e1-vo.mp4"))

(define video
  (file-source 
    #:args "-loop 1"
    @~a{"pasted image 0.png"}))

(render #:to "output.mp4"
	(filt (list video)
	      "vflip,trim=duration=2")
	(filt (list audio)
	      #:audio (list audio)
	      "volume=volume=2,atrim=duration=2"))

#;
(system @~a{ffmpeg -loop 1 -i workspace/"pasted image 0.png" -i workspace/e1-vo.mp4 -filter_complex "[0:v]vflip,trim=duration=1[a254];[1:a]volume=volume=2,atrim=duration=1[A]" -map [a254] -map [A]  -shortest workspace/output.mp4 })

#;
(system @~a{ffmpeg -loop 1 -i workspace/"pasted image 0.png" -i workspace/e1-vo.mp4  -map 0:v -map 1:a -shortest workspace/output.mp4 })

#;
(system @~a{ffmpeg -loop 1 -i workspace/"pasted image 0.png" -i workspace/e1-vo.mp4 -filter_complex "[0:v]scale=iw*min(600/iw\,400/ih):ih*min(600/iw\,400/ih),pad=600:400:(600-iw*min(600/iw\,400/ih))/2:(400-ih*min(600/iw\,400/ih))/2,setsar=1:1[a819];nullsrc=size=640x480,trim=start=0:duration=20[a322];[a819][a322]overlay[a359];[1:a]volume=volume=2[a719]" -map [a359] -map [a719] workspace/output.mp4 })

(system "xdg-open workspace/output.mp4")
